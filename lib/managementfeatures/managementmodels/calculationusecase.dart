import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart';

import '../managementdomain/entities.dart/paymentdetails.dart';

double total(double? add1,double? add2){
  return  add1! + add2!;
}

double percentprice(double? actualprice,double? dis){
    double ac = actualprice??0;
    double di = dis??0;
    return ac - (ac* 0.01 * di);

}



  Future<void> createAndPrintPdf(PaymentDetails paymentDetails) async {
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
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfData,
    );

    // final outputFile = await _getOutputFile();
    // final file = File(outputFile.path);
    // await file.writeAsBytes(pdfData);

    // print('PDF saved and sent to printer: ${outputFile.path}');
  }

  Future<Uint8List> _loadImageData(String path) async {
    final ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }

