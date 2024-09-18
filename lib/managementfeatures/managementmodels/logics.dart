import 'dart:developer';

import 'package:xtreme_fitness/managementfeatures/managementdomain/entities.dart/userpaymentmodel.dart';

class Logics {
  static double totalamounts(List<Alluserpaymentmodel> payment, DateTime date) {
    double total = 0;

    List<Alluserpaymentmodel> d = payment
        .where((element) => element.paymentDate.day == date.day)
        .toList();
    for (var element in d) {
      if (element.paymentStatus == "Success") {
        total += element.receivedAmount;
      }
    }

    log("Total amount :$total");

    return total;
  }
}
