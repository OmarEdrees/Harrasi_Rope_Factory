import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/features/raw_materials/view_models/add_raw_material_cubit/add_raw_material_cubit.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/add_material_modal_bottom_sheet_body.dart';

class AddMaterialFloatActionButton extends StatelessWidget {
  const AddMaterialFloatActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            ),
          ),
          builder: (context) {
            return BlocProvider(
              create: (context) => AddRawMaterialCubit(),
              child: AddMaterialModalBottomSheetBody(),
            );
          },
        );
      },
      backgroundColor: AppColors.kThirdColor,
      child: Icon(
        Icons.add,
        color: AppColors.kPrimaryColor,
      ),
    );
  }
}
