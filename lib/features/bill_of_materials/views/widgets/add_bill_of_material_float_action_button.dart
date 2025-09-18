import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/veiw_models/add_bill_of_material_cubit/add_bill_of_material_cubit.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/add_bill_of_material_modal_bottom_sheet.dart';

class AddBillOfMaterialFloatActionButton extends StatelessWidget {
  const AddBillOfMaterialFloatActionButton({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColors.kPrimaryColor,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            ),
          ),
          builder: (BuildContext context) {
            return BlocProvider(
              create: (context) => AddBillOfMaterialCubit(),
              child: AddBillOfMaterialModalBottomSheetBody(),
            );
          },
        );
      },
      backgroundColor: AppColors.kThirdColor,
      child: Icon(Icons.add, color: AppColors.kPrimaryColor),
    );
  }
}
