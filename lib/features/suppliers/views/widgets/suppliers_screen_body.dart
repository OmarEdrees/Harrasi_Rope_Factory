import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/suppliers/view_models/suppliers/suppliers_cubit.dart';
import 'package:harrasi_rope_factory/features/suppliers/views/widgets/suppliers_sliver_list_view.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class SuppliersScreenBody extends StatelessWidget {
  const SuppliersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SuppliersCubit>();

    return SafeArea(
      child: BlocListener<SuppliersCubit, SuppliersState>(
        listener: (context, state) {
          if (state is DeleteSupplierFailure) {
            CustomQuickAlert.error(
              title: LocaleKeys
                  .sales_invoices_add_sales_customQuickAlert_error_title
                  .tr(),
              message: state.message,
              animationType: CustomQuickAlertAnimationType.slideInDown,
            );
          }
          if (state is DeleteSupplierSuccess) {
            CustomQuickAlert.success(
              title:
                  LocaleKeys.sales_invoices_add_sales_customQuickAlert_title.tr(),
              message: LocaleKeys.suppliers_delete_supplier_CustomQuickAlert_message.tr(),
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
                title: LocaleKeys.suppliers_details_modal_Suppliers_title.tr(),
                icon: FontAwesomeIcons.truck,
              ),
              SizedBox(height: SizeConfig.height * 0.02),
              CustomTextFormField(
                hintText:
                    LocaleKeys.suppliers_details_modal_search_hintText.tr(),
                onChanged: (value) {
                  EasyDebounce.debounce(
                    'supplier-search',
                    const Duration(milliseconds: 400),
                    () => cubit.searchSuppliers(value),
                  );
                },
              ),
              SizedBox(height: SizeConfig.height * 0.04),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => await cubit.getSuppliers(),
                  child: const SuppliersSliverListView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
