import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/categories/view_models/categories_cubit/categories_cubit.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/category_card.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_empty_lottie.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/loading_overlay.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        final cubit = context.read<CategoriesCubit>();
        if (state is GetCategoriesLoading) {
          return Center(
            child: LoadingAnimationWidget.flickr(
              leftDotColor: AppColors.kSecondaryColor,
              rightDotColor: AppColors.kThirdColor,
              size: SizeConfig.height * 0.05,
            ),
          );
        }
        if (state is GetCategoriesFailure) {
          return CustomFailureMessage(message: state.message);
        }
        if (cubit.filterCategories.isEmpty) {
          return const CustomEmptyLottie();
        }
        return LoadingOverlay(
          isLoading: state is DeleteCategoryLoading,
          child: GridView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.4,
            ),
            itemCount: cubit.filterCategories.length,
            itemBuilder: (context, index) {
              final category = cubit.filterCategories[index];
              return CategoryCard(
                key: ValueKey(category.id),
                categoryModel: category,
              );
            },
          ),
        );
      },
    );
  }
}
