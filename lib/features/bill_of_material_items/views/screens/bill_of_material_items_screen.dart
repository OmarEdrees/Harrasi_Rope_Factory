import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/views/widgets/add_bill_of_material_float_action_button.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/views/widgets/bill_of_material_items_screen_body.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/models/bill_of_material_model.dart';

class BillOfMaterialItemsScreen extends StatelessWidget {
  const BillOfMaterialItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var billOfMaterial = BillOfMaterialModel.fromJson(args);
    return Scaffold(
      body: BillOfMaterialItemsScreenBody(billOfMaterial: billOfMaterial),
      floatingActionButton: AddBillOfMaterialItemFloatActionButton(
          billOfMaterial: billOfMaterial),
    );
  }
}
