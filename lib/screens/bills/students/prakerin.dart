import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:skanicbills/util.dart';

import 'main.dart';

void main() async {
  await GetStorage.init();
  Util().getStatus();
}

class PrakerinBillingScreen extends StatelessWidget {
  const PrakerinBillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SKANIC BILLS',
      home: PrakerinBiling(),
    );
  }
}

class PrakerinBiling extends StatefulWidget {
  const PrakerinBiling({super.key});

  @override
  State<PrakerinBiling> createState() => _PrakerinBillingState();
}

class _PrakerinBillingState extends State<PrakerinBiling> {
  @override
  Widget build(BuildContext context) {
    return const InvoiceWidget(
      invoiceIcon: Icons.school,
      invoiceName: 'Prakerin',
      invoicePaid: 1000000,
      invoiceTotal: 4000000,
    );
  }
}
