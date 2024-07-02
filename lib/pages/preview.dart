import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdf_gen/helper/pdf_helper.dart';
import 'package:flutter_pdf_gen/models/bill_model.dart';
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatelessWidget {
  final String count;

  final String serial;

   PdfPreviewPage({Key? key, required this.count,required this.serial}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Bill Preview'),
      ),
      body: InteractiveViewer(
        panEnabled: false,
        boundaryMargin: const EdgeInsets.all(80),
        minScale: 0.5,
        maxScale: 4,
        child: PdfPreview(
          loadingWidget: const CupertinoActivityIndicator(),
          build: (context) => pdfBuilder(count,serial),
        ),
      ),
    );
  }
}
