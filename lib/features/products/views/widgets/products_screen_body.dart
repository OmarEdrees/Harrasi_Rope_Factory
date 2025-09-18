import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/categories_list_view.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/products_grid_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_empty_lottie.dart';
import 'package:harrasi_rope_factory/features/products/view_models/products_cubit/products_cubit.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AddProductScreenBody extends StatelessWidget {
  const AddProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.03,
          vertical: SizeConfig.height * 0.02,
        ),
        child: Column(
          children: [
            CustomPlurTitle(
                title: LocaleKeys.products_add_product_products_title.tr(),
                icon: FontAwesomeIcons.boxOpen),
            SizedBox(height: SizeConfig.height * 0.03),
            Expanded(
              child: RefreshIndicator(
                backgroundColor: AppColors.kThirdColor,
                color: AppColors.kPrimaryColor,
                onRefresh: () async {
                  await cubit.getProducts();
                },
                child: BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    if (state is GetProductsLoading ||
                        state is GetCategoriesLoading) {
                      return Center(
                        child: LoadingAnimationWidget.flickr(
                          leftDotColor: AppColors.kSecondaryColor,
                          rightDotColor: AppColors.kThirdColor,
                          size: SizeConfig.height * 0.05,
                        ),
                      );
                    }
                    if (state is GetProductsFailure) {
                      return CustomFailureMessage(message: state.message);
                    }

                    return ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        CategoriesListView(),
                        SizedBox(height: SizeConfig.height * 0.02),
                        CustomTextFormField(
                          hintText: LocaleKeys
                              .products_add_product_search_hintText
                              .tr(),
                          fillColor: Colors.transparent,
                          onChanged: (value) =>
                              cubit.searchForProducts(value.trim()),
                        ),
                        SizedBox(height: SizeConfig.height * 0.03),
                        cubit.filteredProducts.isEmpty
                            ? CustomEmptyLottie()
                            : ProductsGridView(
                                products: cubit.filteredProducts),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
