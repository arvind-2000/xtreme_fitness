class Paymententity{
  final String paymentid;
  final String transactionid;
  final String uid;
  final double amount;
  final DateTime datetime;
  final String paymentmethod;

  Paymententity(this.paymentmethod, {required this.paymentid, required this.transactionid, required this.uid, required this.amount, required this.datetime});

  
}
class PaymentModel extends Paymententity{
  PaymentModel(super.paymentmethod, {required super.paymentid, required super.transactionid, required super.uid, required super.amount, required super.datetime});


}