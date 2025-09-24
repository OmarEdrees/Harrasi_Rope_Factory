import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/categories/view_models/add_categories_cubit/add_categories_cubit.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class AddCategoryModalBottomSheetBody extends StatelessWidget {
  const AddCategoryModalBottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCategoriesCubit, AddCategoriesState>(
      listener: (context, state) {
        if (state is AddCategoriesSuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title:
                LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
            message: LocaleKeys.categories_customQuickAlert_message.tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is AddCategoriesFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .sales_invoices_add_sales_customQuickAlert_error_title
                .tr(),
            message: state.message,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
      },
      child: DraggableScrollableSheet(
        expand: true,
        shouldCloseOnMinExtent: true,
        initialChildSize: 0.9,
        minChildSize: 0.9,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          final cubit = context.read<AddCategoriesCubit>();
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Center(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width * 0.03,
                    vertical: SizeConfig.height * 0.01,
                  ),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTitle(
                          title: LocaleKeys.categories_customTitle.tr(),
                        ),
                        SizedBox(height: SizeConfig.height * 0.05),
                        CustomTextFormFieldWithTitle(
                          hintText:
                              LocaleKeys.categories_enter_category_name.tr(),
                          title: LocaleKeys.categories_category_Name.tr(),
                          controller: cubit.nameController,
                        ),
                        SizedBox(height: SizeConfig.height * 0.01),
                        CustomTextFormFieldWithTitle(
                          hintText: LocaleKeys
                              .categories_enter_category_description
                              .tr(),
                          title:
                              LocaleKeys.categories_category_Description.tr(),
                          controller: cubit.descriptionController,
                          maxLines: 3,
                        ),
                        SizedBox(height: SizeConfig.height * 0.05),
                        BlocBuilder<AddCategoriesCubit, AddCategoriesState>(
                          buildWhen: (previous, current) {
                            return current is AddCategoriesLoading ||
                                previous is AddCategoriesLoading;
                          },
                          builder: (context, state) {
                            return state is AddCategoriesLoading
                                ? CustomCircularProgresIndecator()
                                : CustomElevatedButton(
                                    onPressed: () {
                                      cubit.addCategory();
                                    },
                                    name:
                                        LocaleKeys.categories_Add_Category.tr(),
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
