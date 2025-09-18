
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/purchases_invoices/views/widgets/add_purchase_invoice_float_action_button.dart';
import 'package:harrasi_rope_factory/features/purchases_invoices/views/widgets/purchases_screen_body.dart';

class PurchasesScreen extends StatelessWidget {
  const PurchasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PurchasesScreenBody(),
      floatingActionButton: AddPurchaseInvoiceFloatActionButton(),
    );
  }
}

