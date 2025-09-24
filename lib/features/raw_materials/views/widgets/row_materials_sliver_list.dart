// ----------------- RawMaterialsListView -----------------
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/raw_materials/view_models/raw_material_cubit/raw_materials_cubit.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/raw_material_list_tile.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/custom_empty_lottie.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/loading_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RawMaterialsListView extends StatelessWidget {
  const RawMaterialsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RawMaterialsCubit, RawMaterialsState>(
      builder: (context, state) {
        final cubit = context.read<RawMaterialsCubit>();

        if (state is GetRawMaterialsLoading) {
          return Center(
            child: LoadingAnimationWidget.flickr(
              leftDotColor: AppColors.kSecondaryColor,
              rightDotColor: AppColors.kThirdColor,
              size: SizeConfig.height * 0.05,
            ),
          );
        }

        if (state is GetRawMaterialsError) {
          return CustomFailureMessage(message: state.error);
        }

        if (cubit.filteredRawMaterials.isEmpty) {
          return const CustomEmptyLottie();
        }

        return LoadingOverlay(
          isLoading: state is DeleteRawMaterialLoading,
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: cubit.filteredRawMaterials.length,
            separatorBuilder: (_, __) =>
                SizedBox(height: SizeConfig.height * 0.015),
            itemBuilder: (context, index) {
              final rawMaterial = cubit.filteredRawMaterials[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width * 0.03,
                ),
                child: RawMaterialListTile(
                  key: ValueKey(rawMaterial.id),
                  listTileShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: AppColors.kThirdColor,
                      width: 1,
                    ),
                  ),
                  rawMaterialModel: rawMaterial,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
