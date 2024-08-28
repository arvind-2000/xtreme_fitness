import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/paymententity.dart';

class Logics{

   static double totalamounts(List<Paymententity> payment,DateTime date){
        double total = 0;
        List<Paymententity> d =  payment.where((element) => element.paymentDate.day == date.day).toList();
        for(Paymententity x in d){
            total += x.amount;

        }

        return total;
    }
}