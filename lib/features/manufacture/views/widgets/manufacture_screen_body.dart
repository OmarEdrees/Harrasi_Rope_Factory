import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/custom_empty_list.dart';
import 'package:harrasi_rope_factory/features/manufacture/view_models/manufacture_items_cubit/manufacture_items_cubit.dart';
import 'package:harrasi_rope_factory/features/manufacture/views/widgets/manufacture_list.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ManufactureScreenBody extends StatelessWidget {
  const ManufactureScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ManufactureItemsCubit>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.03,
          vertical: SizeConfig.height * 0.02,
        ),
        child: Column(
          children: [
            CustomPlurTitle(
                title: LocaleKeys.manufacture_Manufacturer_title.tr(),
                icon: FontAwesomeIcons.wrench),
            SizedBox(height: SizeConfig.height * 0.03),
            Expanded(
              child: BlocBuilder<ManufactureItemsCubit, ManufactureItemsState>(
                builder: (context, state) {
                  if (state is GetManufactureItemsLoading) {
                    return Center(
                      child: LoadingAnimationWidget.flickr(
                        leftDotColor: AppColors.kSecondaryColor,
                        rightDotColor: AppColors.kThirdColor,
                        size: SizeConfig.height * 0.05,
                      ),
                    );
                  }
                  if (state is GetManufactureItemsFailure) {
                    return CustomFailureMessage(message: state.message);
                  }
                  return RefreshIndicator(
                    color: AppColors.kPrimaryColor,
                    backgroundColor: AppColors.kThirdColor,
                    onRefresh: () async {
                      cubit.getManufactureItems();
                    },
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: CustomTextFormField(
                            hintText:
                                LocaleKeys.manufacture_search_hintText.tr(),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: SizeConfig.height * 0.03,
                          ),
                        ),
                        cubit.manufactureItems.isEmpty
                            ? SliverFillRemaining(
                                child: CustomEmptyList(),
                              )
                            : ManufactureList(
                                manufactureItems:
                                    cubit.filteredManufactureItems),
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
