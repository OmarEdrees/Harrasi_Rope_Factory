import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/add_bill_of_material_float_action_button.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/bill_of_material_screen_body.dart';

class BillOfMaterialsScreen extends StatelessWidget {
  const BillOfMaterialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BillOfMaterialsScreenBody(),
      floatingActionButton: AddBillOfMaterialFloatActionButton(),
    );
  }
}



