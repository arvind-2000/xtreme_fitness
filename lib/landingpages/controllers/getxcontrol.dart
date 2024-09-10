import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/dummies.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/managementrepoimpl.dart';

import '../../managementfeatures/managementdomain/entities.dart/planentity.dart';

class GetxLandingcontroller extends GetxController {
  final ManagementrepoImpl managementrepoImpl = ManagementrepoImpl();

  List<Plan> _plan = [];
  List<ServiceEntity> _services = [];

    List<Plan> get getallplans => _plan;  
    List<ServiceEntity> get getallservices => _services;  
    ServiceEntity? services;
    int page = 0;
    int plandurations = 1;
    @override
  void onInit() {
    super.onInit();
    page = 0;
    update();
    getPlans();
    getServices();
  }

  void changeplanduration(int duration) {
    plandurations = duration;
    update();
  }

  void getPlans() async {
    _plan = await managementrepoImpl.getPlans();
    // _plan =dummyplan;
    print(_plan.length);
    update();
  }

    
    void getServices() async{

        _services = await managementrepoImpl.getServices();
        // _services = dummyservices;
        update();
    }

        
    void addServices(ServiceEntity servic) async{

        // _services = await managementrepoImpl.getServices();
        services = servic;
      
    }
    void changelandingpage(int pageindex){
      page = pageindex;
      update();
    }
}
