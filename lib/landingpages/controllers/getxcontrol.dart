import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/managementrepoimpl.dart';

import '../../managementfeatures/managementdomain/entities.dart/planentity.dart';

class GetxLandingcontroller extends GetxController{

    final ManagementrepoImpl managementrepoImpl = ManagementrepoImpl();

    List<Plan> _plan = [];
    List<ServiceEntity> _services = [];

    List<Plan> get getallplans => _plan;  
    List<ServiceEntity> get getallservices => _services;  

    int page = 0;

    @override
  void onInit() {
    super.onInit();
    page = 0;
    update();
    getPlans();
    getServices();
  }


    void getPlans() async{

        _plan = await managementrepoImpl.getPlans();
        print(_plan.length);
        update();
    }

    
    void getServices() async{

        _services = await managementrepoImpl.getServices();
        update();
    }
    void changelandingpage(int pageindex){
      page = pageindex;
      update();
    }
}