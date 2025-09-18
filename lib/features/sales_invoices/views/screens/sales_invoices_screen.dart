import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/views/widgets/add_sales_invoice_float_action_button.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/views/widgets/sales_invoices_screen_body.dart';

class SalesInvoicesScreen extends StatelessWidget {
  const SalesInvoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SalesInvoicesScreenBody(),
      floatingActionButton: AddSalesInvoiceFloatActionButton(),
    );
  }
}
