
import 'package:get/get.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymententity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/servicesentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/trainerentity.dart';
import 'package:xtreme_fitness/managementfeatures/managementdomain/managementrepo.dart';
import 'package:xtreme_fitness/managementfeatures/managementmodels/managementrepoimpl.dart';


import '../../managementdomain/entities.dart/planentity.dart';
import '../../managementdomain/entities.dart/user.dart';
import '../../managementdomain/entities.dart/xtremer.dart';

class ManagementController extends GetxController{

  final ManagementRepo managementRepo = ManagementrepoImpl();

  List<Plan> _allplans = [];
  List<Paymententity> _allpayments = [];
  List<Staff> _allstaff = [];
  List<Xtremer> _allxtremer = [];
  List<TrainerEntity> _alltrainer = [];
  List<TrainerEntity> get getalltrainer => _alltrainer;
  List<Xtremer> get getallXtremer => _allxtremer;
  
  List<ServiceEntity> _allservices = [];
  List<Paymententity> get getallpayments => _allpayments;
  List<Plan> get getallplans =>_allplans;
  List<Staff> get getallstaff =>_allstaff;
  List<ServiceEntity> get getallservices => _allservices;

  @override
  void onInit() {

    super.onInit();
    getplans();
    getxtremer();
    getStaff();
    getallServices();
    getTrainer();
    viewpayment();
  }
  void getplans() async{

      _allplans = await managementRepo.getPlans();

      update();
  }
  void getxtremer() async{

      _allxtremer = await managementRepo.viewMember();
      update();
  }

 Future<String> addplan(Plan plan) async{

      String v = await managementRepo.addPlans(plan: plan);
      // update plans
    
      getplans();

        return v;
  }

    void getallServices() async{

      _allservices = await managementRepo.getServices();
      update();
  }


 Future<String> addservice(ServiceEntity service) async{

      String v = await managementRepo.addServices(service: service);
   
      // update service 
  
      getallServices();

        return v;
  }


  void deletservices(ServiceEntity service)async{
      await managementRepo.deleteServices(service: service).then((value) async{

           getallServices();
      });

  }

    Plan getadmission(){
        // return getallplans.firstWhere((element) => element.category=="Admission",);
      return Plan(id: 0, name: "Admission", durationInMonths:1, price: 1200, category: "Admission", discountPercentage: 0);
    }

  void getStaff() async{

    _allstaff = await managementRepo.viewStaff();
    update();
  }

  void addStaffs(Staff staff)async{
      await managementRepo.addStaff(staff);
        getStaff();
  }

  void getTrainer()async{
    _alltrainer = await managementRepo.viewTrainer();
    update();
  }

  
  void addTrainer(TrainerEntity trainer)async{
      await managementRepo.addTrainer(trainer);
        getTrainer();
  }

    void deleteTrainer(TrainerEntity trainer)async{
      await managementRepo.deleteTrainer(trainer).then((value) async{

           getTrainer();
      });

  }

  void viewpayment()async{
      _allpayments = await managementRepo.viewpayment();
      update();
  }

  void deletplans(Plan plan)async{
      await managementRepo.deletePlans(plan: plan).then((value) async{

           getplans();
      });

  }

  void updateplans(Plan plan)async{
      await managementRepo.updatePlans(plan: plan).then((value) async{

      getplans();
      });
  ;
  }
}