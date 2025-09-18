import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/features/suppliers/view_models/add_supplier_cubit/add_supplier_cubit.dart';
import 'package:harrasi_rope_factory/features/suppliers/views/widgets/add_supplier_modal_bottom_sheet_body.dart';

class AddSupplierFloatActionButton extends StatelessWidget {
  const AddSupplierFloatActionButton({
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
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            ),
          ),
          builder: (context) {
            return BlocProvider(
              create: (context) => AddSupplierCubit(),
              child: AddSupplierModalBottomSheetBody(),
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

