import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_elevated_button.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field_with_title.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/categories/models/category_model.dart';
import 'package:harrasi_rope_factory/features/categories/view_models/edit_category/edit_category_cubit.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_circular_progress_indecator.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class EditCategoryModalBottomSheetBody extends StatelessWidget {
  final CategoryModel categoryModel;
  const EditCategoryModalBottomSheetBody({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditCategoryCubit, EditCategoryState>(
      listener: (context, state) {
        if (state is EditCategorySuccess) {
          context.popScreen();
          CustomQuickAlert.success(
            title: LocaleKeys.categories_update_category_customQuickAlert_title
                .tr(),
            message: LocaleKeys
                .categories_update_category_customQuickAlert_message_update
                .tr(),
            animationType: CustomQuickAlertAnimationType.scale,
          );
        }
        if (state is EditCategoryFailure) {
          CustomQuickAlert.error(
            title: LocaleKeys
                .categories_update_category_customQuickAlert_error_title
                .tr(),
            message: state.message,
            animationType: CustomQuickAlertAnimationType.slideInDown,
          );
        }
        if (state is EditCategoryNoChanges) {
          CustomQuickAlert.warning(
            title: LocaleKeys.categories_update_category_customQuickAlert_title
                .tr(),
            message: LocaleKeys
                .categories_update_category_customQuickAlert_no_changes_message
                .tr(),
            animationType: CustomQuickAlertAnimationType.scale,
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
          final cubit = context.read<EditCategoryCubit>();
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
                          title: LocaleKeys
                              .categories_update_category_customTitle_update
                              .tr(),
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
                        SizedBox(height: SizeConfig.height * 0.01),
                        BlocBuilder<EditCategoryCubit, EditCategoryState>(
                          buildWhen: (previous, current) =>
                              current is ChangeActive,
                          builder: (context, state) {
                            return SwitchListTile(
                              title: Text(
                                  LocaleKeys
                                      .categories_update_category_is_active
                                      .tr(),
                                  style: AppTextStyles.title18White70),
                              value: cubit.isActive,
                              thumbColor: WidgetStateProperty.all(
                                  AppColors.kPrimaryColor),
                              activeColor: AppColors.kThirdColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: AppColors.kThirdColor),
                              ),
                              onChanged: (value) {
                                cubit.changeActive();
                              },
                            );
                          },
                        ),
                        SizedBox(height: SizeConfig.height * 0.05),
                        BlocBuilder<EditCategoryCubit, EditCategoryState>(
                          buildWhen: (previous, current) {
                            return current is EditCategoryLoading ||
                                previous is EditCategoryLoading;
                          },
                          builder: (context, state) {
                            return state is EditCategoryLoading
                                ? CustomCircularProgresIndecator()
                                : CustomElevatedButton(
                                    onPressed: () {
                                      cubit.editCategory();
                                    },
                                    name: LocaleKeys
                                        .categories_update_category_Update_Category
                                        .tr(),
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
