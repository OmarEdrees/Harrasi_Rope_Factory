import 'package:easy_localization/easy_localization.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/custom_empty_list.dart';
import 'package:harrasi_rope_factory/features/purchases_invoices/views/widgets/purchases_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/purchases_invoices/view_models/purchases_cubit/purchases_cubit.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PurchasesScreenBody extends StatelessWidget {
  const PurchasesScreenBody({
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomPlurTitle(
                title:
                    LocaleKeys.purchases_invoices_add_purchase_Purchases.tr(),
                icon: FontAwesomeIcons.cartArrowDown),
            SizedBox(height: SizeConfig.height * 0.03),
            Expanded(
              child: BlocBuilder<PurchasesCubit, PurchasesState>(
                builder: (context, state) {
                  if (state is GetPurchasesLoading) {
                    return LoadingAnimationWidget.flickr(
                      leftDotColor: AppColors.kThirdColor,
                      rightDotColor: AppColors.kPrimaryColor,
                      size: SizeConfig.width * 0.1,
                    );
                  }
                  if (state is GetPurchasesFailure) {
                    return CustomFailureMessage(message: state.message);
                  }
                  var cubit = context.read<PurchasesCubit>();
                  return RefreshIndicator(
                      color: AppColors.kPrimaryColor,
                      backgroundColor: AppColors.kThirdColor,
                      onRefresh: () async {
                        await cubit.getPerchasesInvoice();
                      },
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: CustomTextFormField(
                              hintText: LocaleKeys
                                  .purchases_invoices_add_purchase_search_Purchases
                                  .tr(),
                              onChanged: (p0) {
                                cubit.searchPurchases(p0);
                              },
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(height: SizeConfig.height * 0.03),
                          ),
                          cubit.filteredPurchases.isEmpty
                              ? SliverFillRemaining(child: CustomEmptyList())
                              : PurchasesList(cubit: cubit)
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
