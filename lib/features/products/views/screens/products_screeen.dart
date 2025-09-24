import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/add_product_float_action_bitton.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/products_screen_body.dart';

class ProductsScreeen extends StatelessWidget {
  const ProductsScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddProductScreenBody(),
      floatingActionButton: AddProductFloatActionButton(),
    );
  }
}

