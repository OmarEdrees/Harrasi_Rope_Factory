import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/categories/view_models/categories_cubit/categories_cubit.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/categories_grid_view.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CategoriesCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width * 0.03,
        vertical: SizeConfig.height * 0.02,
      ),
      child: Column(
        children: [
          CustomPlurTitle(
              title: LocaleKeys.categories_categories_title.tr(),
              icon: FontAwesomeIcons.tags),
          SizedBox(height: SizeConfig.height * 0.02),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await cubit.getCategories();
              },
              child: BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
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
                  return Column(
                    children: [
                      CustomTextFormField(
                        fillColor: Colors.transparent,
                        hintText: LocaleKeys.categories_search_hintText.tr(),
                        onChanged: (p0) {
                          cubit.searchForCategory(p0);
                        },
                      ),
                      SizedBox(height: SizeConfig.height * 0.04),
                      CategoriesGridView(cubit: cubit),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
