import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/views/widgets/custom_divider.dart';
import 'package:harrasi_rope_factory/features/purchases_invoices/view_models/purchases_cubit/purchases_cubit.dart';
import 'package:harrasi_rope_factory/features/purchases_invoices/views/widgets/custom_purchase_list_tile.dart';

class PurchasesList extends StatelessWidget {
  const PurchasesList({
    super.key,
    required this.cubit,
  });

  final PurchasesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              CustomPurchaseListTile(
                purchaseInvoiceModel:
                    cubit.filteredPurchases[index],
              ),
              if (index <
                  cubit.filteredPurchases.length - 1)
                CustomDivider(),
            ],
          );
        },
        childCount: cubit.filteredPurchases.length,
      ));
  }
}

