import 'package:easy_localization/easy_localization.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/custom_empty_list.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/view_models/sales_invoices_cubit/sales_invoices_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/views/widgets/sales_invoices_list.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SalesInvoicesScreenBody extends StatelessWidget {
  const SalesInvoicesScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.03,
          vertical: SizeConfig.height * 0.02,
        ),
        child: Column(
          children: [
            CustomPlurTitle(
                title: LocaleKeys.sales_invoices_add_sales_screen_title.tr(),
                icon: FontAwesomeIcons.cashRegister),
            Expanded(
              child: BlocBuilder<SalesInvoicesCubit, SalesInvoicesState>(
                builder: (context, state) {
                  if (state is GetSalesInvoicesLoading) {
                    return Center(
                      child: LoadingAnimationWidget.flickr(
                        leftDotColor: AppColors.kThirdColor,
                        rightDotColor: AppColors.kPrimaryColor,
                        size: SizeConfig.width * 0.1,
                      ),
                    );
                  }
                  if (state is GetSalesInvoicesFailure) {
                    return CustomFailureMessage(message: state.message);
                  }
                  var cubit = context.read<SalesInvoicesCubit>();
                  return RefreshIndicator(
                    color: AppColors.kPrimaryColor,
                    backgroundColor: AppColors.kThirdColor,
                    onRefresh: () async {
                      await cubit.getPerchasesInvoice();
                    },
                    child: CustomScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.height * 0.03,
                            ),
                            child: CustomTextFormField(
                              hintText: LocaleKeys
                                  .sales_invoices_add_sales_search_hintText
                                  .tr(),
                              onChanged: (p0) {
                                cubit.searchSales(p0);
                              },
                            ),
                          ),
                        ),
                        cubit.filteredSales.isEmpty
                            ? SliverFillRemaining(
                                child: CustomEmptyList(),
                              )
                            : SalesInvoicesList(sales: cubit.filteredSales),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
