// ----------------- RawMaterialsScreenBody -----------------
import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/raw_materials/view_models/raw_material_cubit/raw_materials_cubit.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/row_materials_sliver_list.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class RawMaterialsScreenBody extends StatelessWidget {
  const RawMaterialsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RawMaterialsCubit>();

    return SafeArea(
      child: BlocListener<RawMaterialsCubit, RawMaterialsState>(
        listener: (context, state) {
          if (state is DeleteRawMaterialError) {
            CustomQuickAlert.error(
              title: LocaleKeys
                  .sales_invoices_add_sales_customQuickAlert_error_title
                  .tr(),
              message: state.error,
              animationType: CustomQuickAlertAnimationType.slideInDown,
            );
          }
          if (state is DeleteRawMaterialSuccess) {
            CustomQuickAlert.success(
              title:
                  LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
              message: LocaleKeys.raw_materials_customQuickAlert_message.tr(),
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
                title: LocaleKeys.raw_materials_raw_materials_title.tr(),
                icon: FontAwesomeIcons.boxesStacked,
              ),
              SizedBox(height: SizeConfig.height * 0.02),
              CustomTextFormField(
                hintText: LocaleKeys.raw_materials_search_hintText.tr(),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.kThirdColor,
                  size: SizeConfig.height * 0.03,
                ),
                onChanged: (value) {
                  EasyDebounce.debounce(
                    'raw-materials-search',
                    const Duration(milliseconds: 400),
                    () => cubit.searchMaterial(value),
                  );
                },
              ),
              SizedBox(height: SizeConfig.height * 0.03),
              Expanded(
                child: RefreshIndicator(
                  color: AppColors.kPrimaryColor,
                  backgroundColor: AppColors.kThirdColor,
                  onRefresh: () async => await cubit.getMaterials(),
                  child: const RawMaterialsListView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
