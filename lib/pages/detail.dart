import 'package:flutter/material.dart';
import 'package:flutter_pdf_gen/models/bill_model.dart';
import 'package:flutter_pdf_gen/pages/custom_form.dart';
import 'package:flutter_pdf_gen/pages/preview.dart';

class DetailPage extends StatelessWidget {
  final BillModel singleBillItem;
   DetailPage({
    Key? key,
    required this.singleBillItem,
  }) : super(key: key);

TextEditingController countController = TextEditingController();
  TextEditingController serialController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      floatingActionButton: _fab(context),
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  /// Body
  Widget _buildBody(BuildContext context) {
    return ListView(
      children: [
 CustomFormfield(
                          name: "Number",
                          controller: countController,
                          validator: (count) {
                            
                            if (count.toString().isEmpty) {
                              return "enter value";
                            }
                            return null;
                          },
                          prefix: const Icon(Icons.numbers),
                        ),
                        const Divider(),

                        CustomFormfield(
                          obscureText: false,
                          name: "Serial",
                          controller: serialController,
                          prefix: const Icon(Icons.abc),
                        ),        
      ],
    );
  }

  /// AppBar
  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        singleBillItem.name,
        maxLines: 2,
      ),
    );
  }

  /// Floating Action Button
  Widget _fab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PdfPreviewPage(count: countController.text,serial: serialController.text,),
          ),
        );
        // rootBundle.
      },
      child: const Icon(Icons.picture_as_pdf),
    );
  }
}
