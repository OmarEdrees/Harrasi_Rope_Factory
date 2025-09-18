import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/categories/view_models/categories_cubit/categories_cubit.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/category_card.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_empty_lottie.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({
    super.key,
    required this.cubit,
  });

  final CategoriesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: cubit.filterCategories.isEmpty
          ? const CustomEmptyLottie()
          : GridView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
              ),
              itemBuilder: (context, index) =>
                  CategoryCard(categoryModel: cubit.filterCategories[index]),
              itemCount: cubit.filterCategories.length,
            ),
    );
  }
}
