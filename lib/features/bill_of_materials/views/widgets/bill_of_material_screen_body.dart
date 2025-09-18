import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/veiw_models/bill_of_materials_cubit/bill_of_materials_cubit.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/bill_of_materials_list_view.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BillOfMaterialsScreenBody extends StatelessWidget {
  const BillOfMaterialsScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            SizedBox(
              height: SizeConfig.height * 0.03,
            ),
            Expanded(
              child: BlocBuilder<BillOfMaterialsCubit, BillOfMaterialsState>(
                builder: (context, state) {
                  if (state is GetBillOfMaterialsLoading) {
                    return Center(
                      child: LoadingAnimationWidget.flickr(
                        leftDotColor: AppColors.kSecondaryColor,
                        rightDotColor: AppColors.kThirdColor,
                        size: SizeConfig.height * 0.05,
                      ),
                    );
                  }
                  if (state is GetBillOfMaterialsFailure) {
                    return CustomFailureMessage(message: state.errorMessage);
                  }
                  var billOfMaterialsCubit =
                      context.read<BillOfMaterialsCubit>();
                  return RefreshIndicator(
                    onRefresh: () async {
                      await billOfMaterialsCubit.getBillOfMaterials();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFormField(
                          hintText:
                              LocaleKeys.bill_of_materials_search_hintText.tr(),
                          onChanged: (query) {
                            billOfMaterialsCubit.searchForBillOfMaterials(
                                query: query);
                          },
                        ),
                        SizedBox(
                          height: SizeConfig.height * 0.03,
                        ),
                        BillOfMaterialsListView(
                          billOfMaterials:
                              billOfMaterialsCubit.filterBillOfMaterials,
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
