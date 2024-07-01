import 'dart:typed_data';

import 'package:pdf/pdf.dart';

import '../../models/bill_model.dart';
import 'package:pdf/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart' as pw;


Future<Uint8List> pdfBuilder() async {
  final image = MemoryImage(
      (await rootBundle.load('assets/arrows.jpg')).buffer.asUint8List());

       final pdf = pw.Document();

  // Load the images


 List.generate(1000, (index) => pdf.addPage(
    Page(
      build: (context) {
        
         return pw.Stack(
          children: [
            // Background image
            pw.Positioned.fill(
              child: pw.Image(image, fit: pw.BoxFit.cover),
            ),
            // Content on top of the background image
            pw.Positioned(
              left: 375,
              top: 165,
              child: pw.Text(
                "${850+index}",
                style: pw.TextStyle(color: PdfColors.red, fontSize: 18,fontWeight:FontWeight.bold ,),
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