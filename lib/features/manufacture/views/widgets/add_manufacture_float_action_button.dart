import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/features/manufacture/view_models/add_manufacture_item_cubit/add_manufacture_item_cubit.dart';
import 'package:harrasi_rope_factory/features/manufacture/views/widgets/add_manucafture_modal_bottom_sheet_body.dart';

class AddManufactureFloatingActionButton extends StatelessWidget {
  const AddManufactureFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.kThirdColor,
      child: Icon(
        Icons.add,
        color: AppColors.kPrimaryColor,
      ),
      onPressed: () {
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
              create: (context) => AddManufactureItemCubit(),
              child: AddManucaftureModalBottomSheetBody(),
            );
          },
        );
      },
    );
  }
}

