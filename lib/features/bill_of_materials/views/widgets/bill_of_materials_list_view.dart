import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/models/bill_of_material_model.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/bill_of_materials_list_tile.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/custom_empty_list.dart';

class BillOfMaterialsListView extends StatelessWidget {
  const BillOfMaterialsListView({
    super.key,
    required this.billOfMaterials,
  });

  final List<BillOfMaterialModel> billOfMaterials;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: billOfMaterials.isEmpty
          ? CustomEmptyList()
          : ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: SizeConfig.height * 0.015,
              ),
              itemCount: billOfMaterials.length,
              itemBuilder: (context, index) {
                return BillOfMaterialsListTile(
                  billOfMaterialModel: billOfMaterials[index],
                );
              },
            ),
    );
  }
}
