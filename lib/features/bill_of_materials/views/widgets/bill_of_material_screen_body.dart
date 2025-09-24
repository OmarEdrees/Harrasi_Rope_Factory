import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/veiw_models/bill_of_materials_cubit/bill_of_materials_cubit.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/bill_of_materials_list_view.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class BillOfMaterialsScreenBody extends StatelessWidget {
  const BillOfMaterialsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BillOfMaterialsCubit>();
    return SafeArea(
      child: BlocListener<BillOfMaterialsCubit, BillOfMaterialsState>(
        listener: (context, state) {
          if (state is DeleteBillOfMaterialFailure) {
            CustomQuickAlert.error(
              title: LocaleKeys
                  .sales_invoices_add_sales_customQuickAlert_error_title
                  .tr(),
              message: state.errorMessage,
              animationType: CustomQuickAlertAnimationType.slideInDown,
            );
          }
          if (state is DeleteBillOfMaterialSuccess) {
            CustomQuickAlert.success(
              title:
                  LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
              message: LocaleKeys.bill_of_materials_customQuickAlert_delete_success.tr(),
              animationType: CustomQuickAlertAnimationType.scale,
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width * 0.05,
            vertical: SizeConfig.height * 0.02,
          ),
          child: Column(
            children: [
              CustomPlurTitle(
                title: LocaleKeys.bill_of_materials_Bill_of_Materials_title.tr(),
                icon: FontAwesomeIcons.listCheck,
              ),
              SizedBox(height: SizeConfig.height * 0.02),
              CustomTextFormField(
                hintText: LocaleKeys.bill_of_materials_search_hintText.tr(),
                onChanged: (query) {
                  EasyDebounce.debounce(
                    'bill-of-materials-search',
                    const Duration(milliseconds: 400),
                    () => cubit.searchForBillOfMaterials(query: query),
                  );
                },
              ),
              SizedBox(height: SizeConfig.height * 0.03),
              const Expanded(
                child: BillOfMaterialsListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
