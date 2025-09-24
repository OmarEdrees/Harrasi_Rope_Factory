import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/delete_and_edit_menu_button.dart';
import 'package:harrasi_rope_factory/features/raw_materials/models/raw_material_model.dart';
import 'package:harrasi_rope_factory/features/raw_materials/view_models/edit_raw_material_cubit/edit_raw_material_cubit.dart';
import 'package:harrasi_rope_factory/features/raw_materials/view_models/raw_material_cubit/raw_materials_cubit.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/edit_raw_material_modal_bottom_sheet_body.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/raw_material_details_modal_bottom_sheet_body.dart';

class RawMaterialListTile extends StatelessWidget {
  const RawMaterialListTile({
    super.key,
    required this.rawMaterialModel,
    required this.listTileShape,
  });

  final RawMaterialModel rawMaterialModel;
  final RoundedRectangleBorder listTileShape;

  @override
  Widget build(BuildContext context) {
    final GlobalKey btnKey = GlobalKey();
    return ListTile(
      title: Text(
        rawMaterialModel.name,
        style: AppTextStyles.title16ThirdColorW500,
      ),
      subtitle: Text(
        "${rawMaterialModel.currentStock}  ${rawMaterialModel.unit}",
        style: AppTextStyles.title14White70,
      ),
      trailing: DeleteAndEditMenuButton(
        btnKey: btnKey,
        iconColor: AppColors.kThirdColor,
        onDeleteTap: () {
          context
              .read<RawMaterialsCubit>()
              .deleteRawMaterial(id: rawMaterialModel.id);
        },
        onEditTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: AppColors.kPrimaryColor,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            builder: (context) {
              return BlocProvider(
                create: (context) =>
                    EditRawMaterialCubit(material: rawMaterialModel),
                child: EditRawMaterialModalBottomSheetBody(
                    material: rawMaterialModel),
              );
            },
          );
        },
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.kPrimaryColor,
          builder: (context) {
            return RawMaterialDetailsModalBottomSheetBody(
              rawMaterialModel: rawMaterialModel,
            );
          },
        );
      },
      shape: listTileShape,
    );
  }
}
