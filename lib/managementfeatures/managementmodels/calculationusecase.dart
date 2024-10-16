import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import 'dart:html' as html;
import 'package:excel/excel.dart';
import 'package:printing/printing.dart';

import '../managementdomain/entities.dart/membership.dart';
import '../managementdomain/entities.dart/paymententity.dart';
import '../managementdomain/entities.dart/paymenttrans.dart';
import '../managementdomain/entities.dart/subscription.dart';
import '../managementdomain/entities.dart/userpaymentmodel.dart';
import '../managementdomain/entities.dart/xtremer.dart';
import '../managementdomain/entities.dart/xtremerwithsubs.dart';

double total(double? add1,double? add2){
  return  add1! + add2!;
}

double percentprice(double? actualprice,double? dis){
    double ac = actualprice??0;
    double di = dis??0;
    return ac - (ac* 0.01 * di);

}



  Future<void> createAndprintPdf(PaymentByTransaction paymentDetails,{bool isprint = true}) async {
    final pdf = pw.Document();
    //print("in //print pdf");
    final logoData = await _loadImageData('assets/logo3.png');


      pdf.addPage(
      pw.Page(
        
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(16),
      build: (pw.Context context) {
        return pw.Container(
          height: 420,
          child:  pw.Padding(
          padding: const pw.EdgeInsets.all(16),
          child: pw.Container(
                 padding: const pw.EdgeInsets.all(20),
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.red800,
                        width: 2,
                      )),
            child: pw.Container(
              padding: const pw.EdgeInsets.all(20),
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 1,
                      )
                  ),
            child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Image(pw.MemoryImage(logoData), width: 50, height: 50),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Xtreme Fitness',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                'MantriPukhri, Imphal West',
                style: pw.TextStyle(fontSize: 10),
              ),
                 pw.Text(
                '795001',
                style: pw.TextStyle(fontSize: 10),
              ),
              // pw.Text(
              //   'Email: info@company.com',
              //   style: pw.TextStyle(fontSize: 18),
              // ),
              pw.SizedBox(height: 10),
                pw.Text(
                'Payment Receipt',
                style: pw.TextStyle(fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 20),
           
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                pw.Text(
                'Receipt# ${paymentDetails.transactionId}',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.Text(
                'Date: ${paymentDetails.paymentDate.day}/${paymentDetails.paymentDate.month}/${paymentDetails.paymentDate.year}',
                style: pw.TextStyle(fontSize: 10),
              ),

                ]
              ),
       
              pw.SizedBox(height: 20),
                       pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'Payment received from: ',
                    style: pw.TextStyle(fontSize: 12),
                  ),
                  pw.Text(
                    '${paymentDetails.fullName}',
                    style: pw.TextStyle(fontSize: 12),
                  ),
                ]
                
              ),
 pw.SizedBox(height: 10),
                   pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'For:',
                    style: pw.TextStyle(fontSize: 10),
                  ),
                  pw.Text(
                    paymentDetails.paymentType.replaceAll('+', ' & ').toString(),
                    style: const pw.TextStyle(fontSize: 10),
                  ),
                ]
                
              ),
           pw.SizedBox(height: 20),
              pw.Row(children: [
                pw.Expanded(flex: 1,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                              pw.Text(
                    'Payment Received in:',
                    style: const pw.TextStyle(fontSize: 12),
                  ),
                  pw.Text(
                      paymentDetails.paymentMethod,
                    style: const pw.TextStyle(fontSize: 12),
                  ),
                  ]
                )
                ),
                
                pw.Expanded(
                  flex: 1,
                  child: pw.Container(
                      
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 1,
                      )
                  ),
                  child:  pw.Column(
                children: [
                        pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                   pw.Expanded(child:   pw.Text(
                    '  Amount: ',
                    style: pw.TextStyle(fontSize: 10),
                  ),),
                  
          
                     pw.Expanded(child:     pw.Text(
                    'Rs. ${paymentDetails.amount.toStringAsFixed(2)}',
                    style: pw.TextStyle(fontSize: 10),
                  ), ),
             
                ],

                
              ),
                  pw.Container(
                  height:0.5,
                    color: PdfColors.black,
                  ),
                          pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                   pw.Expanded(child:    pw.Text(
                    '  Discount: ',
                    style: pw.TextStyle(fontSize: 10),
                  ), ),
                  // pw.Container(
                  //   margin: pw.EdgeInsets.symmetric(horizontal: 4),
                  //    height: 20,
                  //   color: PdfColors.black
                  //   ),
                    pw.Expanded(child:     pw.Text(
                    '${paymentDetails.discountPercentage.toStringAsFixed(0)}%',
                    style: pw.TextStyle(fontSize: 10),
                  ),),
              
                ],
              ),
                    pw.Container(
                  height:0.5,
                    color: PdfColors.black,
                  ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                   pw.Expanded(child:     pw.Text(
                    '  Received: ',
                    style: pw.TextStyle(fontSize: 10),
                  ),),
             
                    // pw.Container(
                    // margin: pw.EdgeInsets.symmetric(horizontal: 4),
                    //  height: 20,
                    // color: PdfColors.black
                    // ),
                     pw.Expanded(child:       pw.Text(
                    'Rs. ${paymentDetails.receivedAmount.toStringAsFixed(2)}',
                    style: pw.TextStyle(fontSize: 10),
                  ),),
            
                ],
              ),

                ]
              ),
                ))
               

              ]),
              pw.SizedBox(height: 30),
              //        pw.Row(
              //   mainAxisAlignment: pw.MainAxisAlignment.end,
              //   children: [
              //     pw.Text(
              //       'Signed By: ',
              //       style: pw.TextStyle(fontSize: 10),
              //     ),

              //     pw.Text(
              //       'Staff',
              //       style: pw.TextStyle(fontSize: 10),
              //     ),
              //   ],
              // ),

            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'Note:This receipt is computer generated.',
                    style: pw.TextStyle(fontSize: 10),
                  ),

                ],
              ),
            ],
          ),
          )
          )
        )
        );
      },
    ),
  );


  
    final pdfData = await pdf.save();
  
    // Create a blob from the PDF bytes
    if(isprint){
await Printing.layoutPdf(
      format: PdfPageFormat.a4,
      onLayout: (PdfPageFormat format) async => pdfData,
    );
    }else{
 final blob = html.Blob([pdfData], 'application/pdf');

  // Create a download link
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute('download', '${paymentDetails.transactionId}.pdf')
    ..click();

  // Cleanup
  html.Url.revokeObjectUrl(url);
    }
 
  
    
  }

  Future<Uint8List> _loadImageData(String path) async {
    final ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }



  String? numberauth(String keyword){
    try{
             double.parse(keyword);
          
    }catch(e){
      return "Not a valid number";
    }
  }


// Function to group payments by month and year
Map<int, List<Alluserpaymentmodel>> groupPaymentsByMonth(
    List<Alluserpaymentmodel> payments,DateTime date) {
  
  Map<int, List<Alluserpaymentmodel>> paymentsByMonth = {};

  for (var payment in payments) {
    // Format the date to 'Month Year' (e.g., "July 2023")
   // //print("in payments serarches ${date.year}");
    if(payment.paymentDate.year == date.year){
    
    int monthYear = payment.paymentDate.month;
   // //print("in fliterpayment function ${months[monthYear-1]} ");
    if (paymentsByMonth.containsKey(monthYear)) {
       ////print("in fliterpayment functionds");
      // If the month-year key exists, add the payment to the list
      paymentsByMonth[monthYear]!.add(payment);
    } else {
      // If the month-year key does not exist, create a new list
     ////print("in fliterpayment functionree");
      paymentsByMonth[monthYear] = [payment];
    }
    }

  }


  var sortedKeys = paymentsByMonth.keys.toList()..sort();  // Sort by DateTime in ascending order
  var sortedMap = {for (var key in sortedKeys) key: paymentsByMonth[key]!};

  return sortedMap;
}


// // Function to group payments by month and year
// Map<int, List<Alluserpaymentmodel>> groupPaymentsBydate(
//     List<Alluserpaymentmodel> payments,DateTime date) {
  
//   Map<int, List<Alluserpaymentmodel>> paymentsByday = {};

//   for (var payment in payments) {
//     // Format the date to 'Month Year' (e.g., "July 2023")

//     if(payment.paymentDate.year == date.year && payment.paymentDate.month == date.month){
      
//     int days = payment.paymentDate.day;
//     ////print("in fliterpayment function");
//     if (paymentsByday.containsKey(days)) {
//        ////print("in fliterpayment functionds");
//       // If the month-year key exists, add the payment to the list
//       paymentsByday[days]!.add(payment);
//     } else {
//       // If the month-year key does not exist, create a new list
//     ////print("in fliterpayment functionree");
//       paymentsByday[days] = [payment];
//     }
//     }

//   }
  
//   return paymentsByday;

// }
Map<int, List<Alluserpaymentmodel>> groupPaymentsByDate(
    List<Alluserpaymentmodel> payments) {
  
  Map<int, List<Alluserpaymentmodel>> paymentsByDay = {};
  
  // Check if there are any payments
  if (payments.isEmpty) return paymentsByDay;

  // Find the last payment date
  DateTime lastPaymentDate = payments.map((payment) => payment.paymentDate).reduce((a, b) => a.isAfter(b) ? a : b);

  // Calculate the start date (30 days before the last payment date)
  DateTime startDate = lastPaymentDate.subtract(Duration(days: 30));

  for (var payment in payments) {
    // Check if the payment date is within the last 30 days
    if (payment.paymentDate.isAfter(startDate) && payment.paymentDate.isBefore(lastPaymentDate.add(Duration(days: 1)))) {
      
      int day = payment.paymentDate.day;

      // Group payments by day
      if (paymentsByDay.containsKey(day)) {
        paymentsByDay[day]!.add(payment);
      } else {
        paymentsByDay[day] = [payment];
      }
    }
  }

  return paymentsByDay;
}

Map<int, List<Alluserpaymentmodel>> groupPaymentsByyear(
    List<Alluserpaymentmodel> payments) {
  
  Map<int, List<Alluserpaymentmodel>> paymentsByYear = {};

  for (var payment in payments) {
    // Format the date to 'Month Year' (e.g., "July 2023")

    int year = payment.paymentDate.year;
    ////print("in fliterpayment function");
    if (paymentsByYear.containsKey(year)) {
       ////print("in fliterpayment functionds");
      // If the month-year key exists, add the payment to the list
      paymentsByYear[year]!.add(payment);
    } else {
      // If the month-year key does not exist, create a new list
     ////print("in fliterpayment functionree");
      paymentsByYear[year] = [payment];
    }

  }
  
  return paymentsByYear;

}


Future<bool> exportPaymentDataToExcel(List<Alluserpaymentmodel> paymentList,String payments) async {
  var excel = Excel.createExcel();
  Sheet sheet = excel["Sheet1"];

  // Define headers
  List<String> headers = [ 
   'Transaction ID',
    'Amount',
    'Discount Percentage',
    'Received Amount',
    'Payment Date',
    'Payment Status',
    'Payment Method',
    'Payment Type',
  ];
  
  // Append headers
  try {
  sheet.appendRow(headers.map((e) => TextCellValue(e),).toList());
  
  // Append data rows
  for (var payment in paymentList) {
    sheet.appendRow([
      TextCellValue( payment.transactionId.toString()),
      DoubleCellValue(   payment.amount??0,),
      IntCellValue(  payment.discountPercentage??0,),
      DoubleCellValue(  payment.receivedAmount,),
      DateCellValue.fromDateTime(payment.paymentDate),
      TextCellValue(payment.paymentStatus.toString()),
      TextCellValue(payment.paymentMethod.toString()),
      TextCellValue(payment.paymentType.toString()),
     
    ]);
  }
  
  // Save the file
  var bytes = excel.save(fileName:  'Payments_${DateTime.now()}.xlsx');
  return true;
} on Exception catch (e) {
  // TODO
  return false;
}

  // // Create a Blob from the bytes
  // final blob = html.Blob([bytes], 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
  // final url = html.Url.createObjectUrlFromBlob(blob);

  // // Create a download link and click it programmatically
  // final anchor = html.AnchorElement(href: url)
  //   ..setAttribute('download', 'Payments_${DateTime.now()}.xlsx')
  //   ..click();

  // // Clean up
  // html.Url.revokeObjectUrl(url);
}


Future<bool> exportXtremerDataToExcel(List<XtremerWithSubscription> xtremerlist,List<Membership> memberlist,String payments) async {
  if(xtremerlist.isEmpty){
    return false;
  }else{
  var excel = Excel.createExcel();
  Sheet sheet = excel["Sheet1"];


  // Define headers
  List<String> headers = [ 
    'Membership Id',
    'First Name',
    'Last Name',
    'Phone',
    'Address',
    'Pin Code',
    'Status',
    'Start Date',
    'End Date'
  ];
  
  // Append headers
  try {
  sheet.appendRow(headers.map((e) => TextCellValue(e),).toList());
  
  // Append data rows
  for (var xtremer in xtremerlist) {
    sheet.appendRow([
      TextCellValue( '${memberlist.firstWhereOrNull((element) => element.userId==xtremer.XtremerId,)?.membershipId??""}'),
      TextCellValue( xtremer.firstName.toString()),
      TextCellValue( xtremer.surname.toString()),
      TextCellValue( xtremer.mobileNumber.toString()),
      TextCellValue( xtremer.address.toString()),
      TextCellValue( xtremer.postcode.toString()),
      TextCellValue( xtremer.isActive!=null && xtremer.isActive!?"Active" :"InActive"),
      // IntCellValue(  payment.discountPercentage??0,),
      // DoubleCellValue(  payment.receivedAmount,),
      DateCellValue.fromDateTime(xtremer.startDate??DateTime(2000)),
      DateCellValue.fromDateTime(xtremer.endDate??DateTime(2000)),
      // TextCellValue(payment.paymentStatus.toString()),
      // TextCellValue(payment.paymentMethod.toString()),
     
    ]);
  }
  
  // Save the file
  var bytes = excel.save(fileName: 'XtremerReports_${DateTime.now()}.xlsx');
  
  // Create a Blob from the bytes
  // final blob = html.Blob([bytes], 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
  // final url = html.Url.createObjectUrlFromBlob(blob);
  
  // // Create a download link and click it programmatically
  // final anchor = html.AnchorElement(href: url)
  //   ..setAttribute('download', 'XtremerReports_${DateTime.now()}.xlsx')
  //   ..click();
  
  // // Clean up
  // html.Url.revokeObjectUrl(url);
  return true;
} on Exception catch (e) {
  // TODO
  return false;
}

  }
  



}


List<Alluserpaymentmodel> returnexcelpayments(List<Alluserpaymentmodel> paymentlist,DateTime startdate,DateTime enddate){
  List<Alluserpaymentmodel> listss = [];

  for(Alluserpaymentmodel payment in paymentlist){

    if(payment.paymentDate.compareTo(startdate)>=0&& payment.paymentDate.compareTo(enddate)<=0){
      
      listss.add(payment);

  }
  
  }
  
  return listss;
}


String subscriptiondateStart(List<Subscription> d,int userid){
  // print("in subs start date: ${d.length}");
//  int x =  d.lastIndexWhere((element) => element.userId == userid.toString(),);
  DateTime? date;
  for(Subscription k in d ){
        // print(k.startDate);
    if(k.userId == userid.toString()){
      if(date == null){
        date= k.startDate;
      }else if(date.isAfter(k.startDate)){
        date = k.startDate;
      }

    }
  }


   return date!=null?"${date.day}/${date.month}${date.year}":"no";
  }




String subscriptiondateEnd(List<Subscription> d,int userid){
  DateTime? date;
  // print(d.length);
  for(Subscription k in d ){
    // print(k.endDate);
    if(k.userId == userid.toString()){
      if(date ==null){
        date= k.endDate;
      }else if(date.isAfter(k.endDate)){
        date = k.endDate;
      }

    }
  }


   return date!=null?"${date.day}/${date.month}${date.year}":"";

}

int daysLeftUntil(DateTime futureDate) {
  DateTime currentDate = DateTime.now();
  Duration difference = futureDate.difference(currentDate);
  return difference.inDays;
}