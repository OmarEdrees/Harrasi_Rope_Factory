import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/add_material_float_action_button.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/row_materials_screen_body.dart';

class RawMaterialsScreen extends StatelessWidget {
  const RawMaterialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RawMaterialsScreenBody(),
      floatingActionButton: AddMaterialFloatActionButton(),
    );
  }
}

