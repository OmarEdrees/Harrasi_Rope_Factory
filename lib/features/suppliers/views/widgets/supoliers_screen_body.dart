import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:harrasi_rope_factory/features/suppliers/view_models/suppliers/suppliers_cubit.dart';
import 'package:harrasi_rope_factory/features/suppliers/views/widgets/suppliers_sliver_list_view.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SuppliersScreenBody extends StatelessWidget {
  const SuppliersScreenBody({
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
              title: LocaleKeys.suppliers_details_modal_Suppliers_title.tr(),
              icon: FontAwesomeIcons.truck,
            ),
            SizedBox(height: SizeConfig.height * 0.03),
            Expanded(
              child: BlocBuilder<SuppliersCubit, SuppliersState>(
                builder: (context, state) {
                  if (state is GetSuppliersLoading) {
                    return Center(
                      child: LoadingAnimationWidget.flickr(
                        leftDotColor: AppColors.kSecondaryColor,
                        rightDotColor: AppColors.kThirdColor,
                        size: SizeConfig.height * 0.05,
                      ),
                    );
                  }
                  if (state is GetSuppliersFailure) {
                    return CustomFailureMessage(message: state.message);
                  }
                  var cubit = context.read<SuppliersCubit>();
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
                                    .suppliers_details_modal_search_hintText
                                    .tr(),
                                onChanged: (p0) {
                                  cubit.searchSuppliers(p0);
                                },
                              ),
                              SizedBox(height: SizeConfig.height * 0.03),
                            ],
                          ),
                        ),
                        SuppliersSliverListview(
                          suppliers: cubit.suppliers,
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
