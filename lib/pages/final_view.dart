import 'package:flutter/material.dart';
import 'package:flutter_pdf_gen/pages/detail.dart';
import 'package:remixicon/remixicon.dart';

import '../models/bill_model.dart';

class FinalView extends StatelessWidget {
  FinalView({Key? key}) : super(key: key);

  final bills = <BillModel>[
    BillModel(
      customer: 'Alice Johnson',
      address: '456 Mock Ave\nWonderland',
      items: [
        LineItem('Consultation Services', 150),
        LineItem('Custom Software Development', 2500.75),
        LineItem('Training Session', 180),
      ],
      name: 'Software Consultation and Development',
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  /// AppBar
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Bills'),
      centerTitle: true,
      leading:
          IconButton(onPressed: () {}, icon: const Icon(Remix.menu_2_line)),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Remix.filter_2_line)),
        IconButton(onPressed: () {}, icon: const Icon(Remix.search_2_line)),
      ],
    );
  }

  /// Body
  Widget _buildBody(BuildContext context) {
    return ListView(
      children: [
        ...bills.map(
          (e) => ListTile(
            title: Text(e.name),
            subtitle: Text(e.customer),
            trailing: Text('\$${e.totalCost().toStringAsFixed(2)}'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (builder) => DetailPage(singleBillItem: e),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
