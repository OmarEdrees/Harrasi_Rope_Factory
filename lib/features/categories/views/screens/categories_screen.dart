import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/add_category_float_action_button.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/categories_screen_body.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: CategoriesScreenBody(),
      ),
      floatingActionButton: const AddCategoriesFloatActionButton(),
    );
  }
}




