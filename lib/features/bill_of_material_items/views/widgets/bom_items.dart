import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/view_models/bill_of_material_items/bill_of_material_items_cubit.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/views/widgets/bom_items_list_view.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/views/widgets/custom_no_data_lottie.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BomItems extends StatelessWidget {
  const BomItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.bill_of_materials_item_Bom_Items.tr(),
            style: AppTextStyles.title20KThirdColorBold,
          ),
          SizedBox(height: SizeConfig.height * 0.015),
          Expanded(
            child:
                BlocBuilder<BillOfMaterialItemsCubit, BillOfMaterialItemsState>(
              builder: (context, state) {
                if (state is GetBillOfMaterialItemsLoading) {
                  return Center(
                    child: LoadingAnimationWidget.flickr(
                      leftDotColor: AppColors.kSecondaryColor,
                      rightDotColor: AppColors.kThirdColor,
                      size: SizeConfig.height * 0.05,
                    ),
                  );
                }
                if (state is GetBillOfMaterialItemsFailure) {
                  return CustomFailureMessage(message: state.errorMessage);
                }
                var bomItemCubit = context.read<BillOfMaterialItemsCubit>();
                return RefreshIndicator(
                  onRefresh: () async {
                    await context
                        .read<BillOfMaterialItemsCubit>()
                        .getBillOfMaterialItems();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          hintText: LocaleKeys
                              .bill_of_materials_item_search_hintText
                              .tr(),
                          onChanged: (value) {
                            bomItemCubit.searchForItems(value);
                          },
                        ),
                        SizedBox(height: SizeConfig.height * 0.03),
                        bomItemCubit.filterItems.isEmpty
                            ? CustomNoDataLottie()
                            : BomItemsListView(
                                bomItems: bomItemCubit.filterItems),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
