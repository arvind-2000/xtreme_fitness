import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart';
import 'dart:html' as html;

import '../../config/const.dart';
import '../managementdomain/entities.dart/paymentdetails.dart';
import '../managementdomain/entities.dart/paymententity.dart';
import '../managementdomain/entities.dart/userpaymentmodel.dart';

double total(double? add1,double? add2){
  return  add1! + add2!;
}

double percentprice(double? actualprice,double? dis){
    double ac = actualprice??0;
    double di = dis??0;
    return ac - (ac* 0.01 * di);

}



  Future<void> createAndPrintPdf(Paymententity paymentDetails) async {
    final pdf = pw.Document();
    print("in print pdf");
    final logoData = await _loadImageData('assets/logo2.png');


      pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(20),
      build: (pw.Context context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.all(20),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Image(pw.MemoryImage(logoData), width: 100, height: 100),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'Xtreme Fitness',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                'MantriPukhri, Imphal West\n795001',
                style: pw.TextStyle(fontSize: 18),
              ),
              // pw.Text(
              //   'Email: info@company.com',
              //   style: pw.TextStyle(fontSize: 18),
              // ),
              pw.SizedBox(height: 20),
              pw.Divider(),
              pw.SizedBox(height: 10),
              pw.Text(
                'Transaction ID: ${paymentDetails.transactionId}',
                style: pw.TextStyle(fontSize: 16),
              ),
              pw.Text(
                'Date: ${paymentDetails.paymentDate.day}/${paymentDetails.paymentDate.month}/${paymentDetails.paymentDate.year}',
                style: pw.TextStyle(fontSize: 12
                
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Amount:',
                    style: pw.TextStyle(fontSize: 14),
                  ),
                  pw.Text(
                    'Rs. ${paymentDetails.amount.toStringAsFixed(2)}',
                    style: pw.TextStyle(fontSize: 14),
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Discount:',
                    style: pw.TextStyle(fontSize: 14),
                  ),
                  pw.Text(
                    '${paymentDetails.discountPercentage.toStringAsFixed(0)}%',
                    style: pw.TextStyle(fontSize: 14),
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Received Amount:',
                    style: pw.TextStyle(fontSize: 14),
                  ),
                  pw.Text(
                    'Rs. ${paymentDetails.receivedAmount.toStringAsFixed(2)}',
                    style: pw.TextStyle(fontSize: 14),
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'Payment Details',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Payment Status: ${paymentDetails.paymentStatus}',
                style: pw.TextStyle(fontSize: 14),
              ),
              pw.Text(
                'Payment Method: ${paymentDetails.paymentMethod}',
                style: pw.TextStyle(fontSize: 14),
              ),
              pw.Text(
                'Payment Type: ${paymentDetails.paymentType}',
                style: pw.TextStyle(fontSize: 14),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'Thank you for your purchase!',
                style: pw.TextStyle(fontSize: 16),
              ),
              pw.Divider(
                
              ),
                      pw.Text(
                'This Receipt is computer generated',
                style: pw.TextStyle(fontSize: 14),
              ),
            ],
          ),
        );
      },
    ),
  );


  
    final pdfData = await pdf.save();
  
    // Create a blob from the PDF bytes
  final blob = html.Blob([pdfData], 'application/pdf');

  // Create a download link
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute('download', '${paymentDetails.transactionId}.pdf')
    ..click();

  // Cleanup
  html.Url.revokeObjectUrl(url);
  
    // await Printing.layoutPdf(
    //   onLayout: (PdfPageFormat format) async => pdfData,
    // );

    // final outputFile = await _getOutputFile();
    // final file = File(outputFile.path);
    // await file.writeAsBytes(pdfData);

    // print('PDF saved and sent to printer: ${outputFile.path}');
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
    print("in payments serarches ${date.year}");
    if(payment.paymentDate.year == date.year){
    
    int monthYear = payment.paymentDate.month;
    print("in fliterpayment function ${months[monthYear-1]} ");
    if (paymentsByMonth.containsKey(monthYear)) {
       print("in fliterpayment functionds");
      // If the month-year key exists, add the payment to the list
      paymentsByMonth[monthYear]!.add(payment);
    } else {
      // If the month-year key does not exist, create a new list
     print("in fliterpayment functionree");
      paymentsByMonth[monthYear] = [payment];
    }
    }

  }
  for(var i in paymentsByMonth.entries){
      print(" ${months[i.key]}  ${i.value.length}");

  }
  return paymentsByMonth;
}


// Function to group payments by month and year
Map<int, List<Alluserpaymentmodel>> groupPaymentsBydate(
    List<Alluserpaymentmodel> payments,DateTime date) {
  
  Map<int, List<Alluserpaymentmodel>> paymentsByday = {};

  for (var payment in payments) {
    // Format the date to 'Month Year' (e.g., "July 2023")

    if(payment.paymentDate.year == date.year && payment.paymentDate.month == date.month){
      
    int days = payment.paymentDate.day;
    print("in fliterpayment function");
    if (paymentsByday.containsKey(days)) {
       print("in fliterpayment functionds");
      // If the month-year key exists, add the payment to the list
      paymentsByday[days]!.add(payment);
    } else {
      // If the month-year key does not exist, create a new list
     print("in fliterpayment functionree");
      paymentsByday[days] = [payment];
    }
    }

  }
  
  return paymentsByday;

}


Map<int, List<Alluserpaymentmodel>> groupPaymentsByyear(
    List<Alluserpaymentmodel> payments) {
  
  Map<int, List<Alluserpaymentmodel>> paymentsByYear = {};

  for (var payment in payments) {
    // Format the date to 'Month Year' (e.g., "July 2023")

    int year = payment.paymentDate.year;
    print("in fliterpayment function");
    if (paymentsByYear.containsKey(year)) {
       print("in fliterpayment functionds");
      // If the month-year key exists, add the payment to the list
      paymentsByYear[year]!.add(payment);
    } else {
      // If the month-year key does not exist, create a new list
     print("in fliterpayment functionree");
      paymentsByYear[year] = [payment];
    }

  }
  
  return paymentsByYear;

}