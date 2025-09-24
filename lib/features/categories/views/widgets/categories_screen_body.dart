import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/categories/view_models/categories_cubit/categories_cubit.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/categories_grid_view.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoriesCubit>();
    return BlocListener<CategoriesCubit, CategoriesState>(
      listener: (context, state) {
        if (state is DeleteCategoryFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.message,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is DeleteCategorySuccess) {
          CustomQuickAlert.success(
            title:
                LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
            message: LocaleKeys.categories_customQuickAlert_message.tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.03,
          vertical: SizeConfig.height * 0.02,
        ),
        child: Column(
          children: [
            CustomPlurTitle(
              title: LocaleKeys.categories_categories_title.tr(),
              icon: FontAwesomeIcons.tags,
            ),
            SizedBox(height: SizeConfig.height * 0.02),
            CustomTextFormField(
              onChanged: (value) {
                EasyDebounce.debounce(
                  'category-search',
                  const Duration(milliseconds: 400),
                  () => cubit.searchForCategory(value),
                );
              },
            ),
            SizedBox(height: SizeConfig.height * 0.04),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async => await cubit.getCategories(),
                child: const CategoriesGridView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
