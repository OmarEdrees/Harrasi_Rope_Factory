import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/views/widgets/custom_divider.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/models/sale_model.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/views/widgets/custom_sale_invoice_list_tile.dart';

class SalesInvoicesList extends StatelessWidget {
  const SalesInvoicesList({
    super.key,
    required this.sales
  });

  final List<SaleInvoiceModel> sales;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                CustomSaleInvoiceListTile(
                  saleInvoiceModel:
                      sales[index],
                ),
                if (index < sales.length - 1)
                  CustomDivider(),
              ],
            );
          },
          childCount: sales.length,
        ),
      );
  }
}
