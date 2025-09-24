import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/features/customers/view_models/add_customer_cubit/add_customer_cubit.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/add_customer_modal_bottom_sheet_body.dart';

class AddCustomerFloatActionButton extends StatelessWidget {
  const AddCustomerFloatActionButton({
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
              create: (context) => AddCustomerCubit(),
              child: AddCustomerModalBottomSheetBody(),
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
