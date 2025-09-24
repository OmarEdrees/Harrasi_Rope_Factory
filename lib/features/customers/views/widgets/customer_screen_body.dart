import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/customers/view_models/customer/customers_cubit.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/customers_sliver_list_view.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class CustomersScreenBody extends StatelessWidget {
  const CustomersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CustomersCubit>();

    return SafeArea(
      child: BlocListener<CustomersCubit, CustomersState>(
        listener: (context, state) {
          if (state is DeleteCustomerFailure) {
            CustomQuickAlert.error(
              title: LocaleKeys
                  .sales_invoices_add_sales_customQuickAlert_error_title
                  .tr(),
              message: state.message,
              animationType: CustomQuickAlertAnimationType.slideInDown,
            );
          }
          if (state is DeleteCustomerSuccess) {
            CustomQuickAlert.success(
              title: LocaleKeys.sales_invoices_add_sales_customQuickAlert_title
                  .tr(),
              message: LocaleKeys
                  .customers_delete_customer_customQuickAlert_delete_message
                  .tr(),
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
                title: LocaleKeys.customers_add_customer_Customers_title.tr(),
                icon: FontAwesomeIcons.userGroup,
              ),
              SizedBox(height: SizeConfig.height * 0.02),
              CustomTextFormField(
                hintText:
                    LocaleKeys.customers_add_customer_search_hintText.tr(),
                onChanged: (value) {
                  EasyDebounce.debounce(
                    'customer-search',
                    const Duration(milliseconds: 400),
                    () => cubit.searchCustomers(value),
                  );
                },
              ),
              SizedBox(height: SizeConfig.height * 0.04),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => await cubit.getCustomers(),
                  child: const CustomersSliverListView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
