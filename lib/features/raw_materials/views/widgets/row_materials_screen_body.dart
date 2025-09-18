import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/raw_materials/view_models/raw_material_cubit/raw_materials_cubit.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/row_materials_sliver_list.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RawMaterialsScreenBody extends StatelessWidget {
  const RawMaterialsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RawMaterialsCubit>();
    return SafeArea(
      child: RefreshIndicator(
        color: AppColors.kPrimaryColor,
        backgroundColor: AppColors.kThirdColor,
        onRefresh: () async {
          await cubit.getMaterials();
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width * 0.03,
                  vertical: SizeConfig.height * 0.01,
                ),
                child: Column(
                  children: [
                    CustomPlurTitle(
                      title: LocaleKeys.raw_materials_raw_materials_title.tr(),
                      icon: FontAwesomeIcons.boxesStacked,
                    ),
                    SizedBox(height: SizeConfig.height * 0.03),
                    CustomTextFormField(
                      fillColor: Colors.transparent,
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.kThirdColor,
                        size: SizeConfig.height * 0.03,
                      ),
                      onChanged: (value) {
                        cubit.searchMaterial(value);
                      },
                      hintText: LocaleKeys.raw_materials_search_hintText.tr(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.width * 0.05,
                        right: SizeConfig.width * 0.05,
                        bottom: SizeConfig.height * 0.01,
                        top: SizeConfig.height * 0.02,
                      ),
                      child: Divider(
                        thickness: 1,
                        color: AppColors.kThirdColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// الليستة مع BlocBuilder
            BlocBuilder<RawMaterialsCubit, RawMaterialsState>(
              builder: (context, state) {
                if (state is GetRawMaterialsLoading) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: LoadingAnimationWidget.flickr(
                        leftDotColor: AppColors.kSecondaryColor,
                        rightDotColor: AppColors.kThirdColor,
                        size: SizeConfig.height * 0.05,
                      ),
                    ),
                  );
                }

                if (state is GetRawMaterialsError) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: CustomFailureMessage(
                      message: state.error,
                    ),
                  );
                }

                return RawMaterialsSliverList(
                  rawMaterials: cubit.filteredRawMaterials,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
