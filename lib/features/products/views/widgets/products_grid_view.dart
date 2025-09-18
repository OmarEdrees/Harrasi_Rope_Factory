import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/products/models/product_model.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/product_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: SizeConfig.width * 0.01,
        mainAxisSpacing: SizeConfig.height * 0.01,
      ),
      itemBuilder: (context, index) => ProductCard(
        productModel: products[index],
      ),
      itemCount: products.length,
    );
  }
}
