import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/custom_empty_list.dart';
import 'package:harrasi_rope_factory/features/suppliers/models/supplier_model.dart';
import 'package:harrasi_rope_factory/features/suppliers/views/widgets/custom_supplier_list_tile.dart';

class SuppliersSliverListview extends StatelessWidget {
  const SuppliersSliverListview({
    required this.suppliers,
    super.key,
  });
  final List<SupplierModel> suppliers;

  @override
  Widget build(BuildContext context) {
    if (suppliers.isEmpty) {
      return SliverToBoxAdapter(
        child: CustomEmptyList(),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              CustomSupplierListTile(
                supplierModel: suppliers[index],
              ),
              if (index < suppliers.length - 1)
                SizedBox(height: SizeConfig.height * 0.015),
            ],
          );
        },
        childCount: suppliers.length,
      ),
    );
  }
}
