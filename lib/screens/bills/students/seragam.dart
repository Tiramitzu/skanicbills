import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:skanicbills/screens/bills/students/main.dart';
import 'package:skanicbills/util.dart';

void main() async {
  await GetStorage.init();
  Util().getStatus();
}

class SeragamBillingScreen extends StatelessWidget {
  const SeragamBillingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SKANIC BILLS',
      home: SeragamBilling(),
    );
  }
}

class SeragamBilling extends StatefulWidget {
  const SeragamBilling({Key? key}) : super(key: key);

  @override
  State<SeragamBilling> createState() => _SeragamBillingState();
}

class _SeragamBillingState extends State<SeragamBilling> {
  @override
  Widget build(BuildContext context) {
    return const InvoiceWidget(
      invoiceIcon: Icons.school,
      invoiceName: 'Seragam',
      invoicePaid: 1000000,
      invoiceTotal: 4000000,
    );
  }
}
