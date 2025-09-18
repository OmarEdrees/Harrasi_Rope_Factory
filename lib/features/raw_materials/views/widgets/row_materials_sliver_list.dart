import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/assets/lotties/app_lotties.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/raw_materials/models/raw_material_model.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/raw_material_list_tile.dart';
import 'package:lottie/lottie.dart';

class RawMaterialsSliverList extends StatelessWidget {
  const RawMaterialsSliverList({
    super.key,
    required this.rawMaterials,
  });
  final List<RawMaterialModel> rawMaterials;
  @override
  Widget build(BuildContext context) {
    final listTileShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(color: AppColors.kThirdColor, width: 1),
    );
    return rawMaterials.isEmpty
        ? SliverFillRemaining(
            child: Center(child: Lottie.asset(AppLotties.emptyLottie)),
          )
        : SliverList.separated(
            itemCount: rawMaterials.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width * 0.03,
                ),
                child: RawMaterialListTile(
                  listTileShape: listTileShape,
                  rawMaterialModel: rawMaterials[index],
                ),
              );
            },
            separatorBuilder: (_, __) => SizedBox(
              height: SizeConfig.height * 0.015,
            ),
          );
  }
}
