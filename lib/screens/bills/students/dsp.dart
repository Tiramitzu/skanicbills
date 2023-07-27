import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:skanicbills/util.dart';

import 'main.dart';

void main() async {
  await GetStorage.init();
  Util().getStatus();
}

class DSPBillingScreen extends StatelessWidget {
  const DSPBillingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SKANIC BILLS',
      home: DSPBiling(),
    );
  }
}

class DSPBiling extends StatefulWidget {
  const DSPBiling({Key? key}) : super(key: key);

  @override
  State<DSPBiling> createState() => _DSPBillingState();
}

class _DSPBillingState extends State<DSPBiling> {
  @override
  Widget build(BuildContext context) {
    return const InvoiceWidget(
      invoiceIcon: Icons.school,
      invoiceName: 'DSP',
      invoicePaid: 1000000,
      invoiceTotal: 4000000,
    );
  }
}
