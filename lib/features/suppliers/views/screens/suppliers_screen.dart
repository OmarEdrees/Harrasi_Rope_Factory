import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/suppliers/views/widgets/add_supplier_float_action_button.dart';
import 'package:harrasi_rope_factory/features/suppliers/views/widgets/supoliers_screen_body.dart';

class SuppliersScreen extends StatelessWidget {
  const SuppliersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SuppliersScreenBody(),
      floatingActionButton: AddSupplierFloatActionButton(),
    );
  }
}



