import 'dart:typed_data';

import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> pdfBuilder() async {
  final image = MemoryImage(
      (await rootBundle.load('assets/arrows.jpg')).buffer.asUint8List());

  final pdf = pw.Document();

  int page = 1100;

  List.generate(
    100,
    (index) => pdf.addPage(
      Page(
        build: (context) {

          if (index.isEven) {
            page = page + 1;
          }

          return index.isEven
              ? pw.Stack(
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
                        "${page }",
                        style: pw.TextStyle(
                          color: PdfColors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              : pw.Stack(
                  children: [
                    pw.Positioned.fill(
                      child: pw.Container(color: PdfColors.white),
                    ),
                    pw.Positioned(
                      left: 375,
                      top: 165,
                      child: pw.Text(
                        "${page}",
                        style: pw.TextStyle(
                          color: PdfColors.red,
                          fontSize: 18,
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
