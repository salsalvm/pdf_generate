import 'dart:typed_data';

import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> pdfBuilder(String pageCount ,String serial) async {
  final image = MemoryImage(
      (await rootBundle.load('assets/arrows1.jpg')).buffer.asUint8List());

  final pdf = pw.Document();

  List.generate(
    50,
    (index) => pdf.addPage(

      Page(
        pageFormat: PdfPageFormat.a4,
        orientation: PageOrientation.landscape,
        margin: EdgeInsets.zero,

        build: (context) {

          

          return  pw.Stack(
                  children: [
                    pw.Positioned.fill(
                      child: pw.Image(image, fit: pw.BoxFit.cover),
                    ),
                    pw.Positioned(
                      left: 310,
                      top: 157,
                      child: pw.Text(
                        "$serial ${ int.parse(pageCount) + index +1 }",
                     
                        style: pw.TextStyle(
                          color: PdfColors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                     pw.Positioned(
                      left: 680,
                      top: 157,
                      child: pw.Text(
                        "$serial ${ int.parse(pageCount) + index +1 }",
                     
                        style: pw.TextStyle(
                          color: PdfColors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              
        },
      ),
    ),
  );
  return pdf.save();
}

Widget textAndPadding(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.all(1),
      child: Text(
        text,
        textAlign: align,
      ),
    );
