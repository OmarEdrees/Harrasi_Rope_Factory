import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/customers/view_models/customer/customers_cubit.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/customers_sliver_list_view.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomersScreenBody extends StatelessWidget {
  const CustomersScreenBody({
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
              title: LocaleKeys.customers_add_customer_Customers_title.tr(),
              icon: FontAwesomeIcons.userGroup,
            ),
            SizedBox(height: SizeConfig.height * 0.03),
            Expanded(
              child: BlocBuilder<CustomersCubit, CustomersState>(
                builder: (context, state) {
                  if (state is GetCustomersLoading) {
                    return Center(
                      child: LoadingAnimationWidget.flickr(
                        leftDotColor: AppColors.kSecondaryColor,
                        rightDotColor: AppColors.kThirdColor,
                        size: SizeConfig.height * 0.05,
                      ),
                    );
                  }
                  if (state is GetCustomersFailure) {
                    return CustomFailureMessage(message: state.message);
                  }
                  var cubit = context.read<CustomersCubit>();
                  return RefreshIndicator(
                    onRefresh: () async {
                      await cubit.getSuppliers();
                    },
                    color: AppColors.kThirdColor,
                    backgroundColor: AppColors.kPrimaryColor,
                    child: CustomScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              CustomTextFormField(
                                hintText: LocaleKeys
                                    .customers_add_customer_search_hintText
                                    .tr(),
                                onChanged: (p0) {
                                  cubit.searchCustomers(p0);
                                },
                              ),
                              SizedBox(height: SizeConfig.height * 0.03),
                            ],
                          ),
                        ),
                        CustomersSliverListview(
                          customers: cubit.filteredCustomers,
                        ),
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
