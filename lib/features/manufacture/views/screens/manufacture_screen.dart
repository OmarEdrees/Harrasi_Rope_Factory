import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/manufacture/views/widgets/add_manufacture_float_action_button.dart';
import 'package:harrasi_rope_factory/features/manufacture/views/widgets/manufacture_screen_body.dart';

class ManufactureScreen extends StatelessWidget {
  const ManufactureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ManufactureScreenBody(),
      floatingActionButton: AddManufactureFloatingActionButton(),
    );
  }
}
