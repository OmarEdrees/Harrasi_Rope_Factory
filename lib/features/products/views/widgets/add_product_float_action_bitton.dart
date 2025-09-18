import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/features/products/view_models/add_products_cubit/add_product_cubit.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/add_product_modal_bottom_sheet_body.dart';

class AddProductFloatActionButton extends StatelessWidget {
  const AddProductFloatActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.kThirdColor,
      child: Icon(Icons.add, color: AppColors.kPrimaryColor),
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
          builder: (context) {
            return BlocProvider(
              create: (context) => AddProductCubit(),
              child: AddProductModalBottomSheetBody(),
            );
          },
        );
      },
    );
  }
}