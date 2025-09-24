import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/delete_and_edit_menu_button.dart';
import 'package:harrasi_rope_factory/features/suppliers/models/supplier_model.dart';
import 'package:harrasi_rope_factory/features/suppliers/view_models/edit_supplier_cubit/edit_supplier_cubit.dart';
import 'package:harrasi_rope_factory/features/suppliers/view_models/suppliers/suppliers_cubit.dart';
import 'package:harrasi_rope_factory/features/suppliers/views/widgets/edit_supplier_modal_bottom_sheet_body.dart';
import 'package:harrasi_rope_factory/features/suppliers/views/widgets/supplier_details_modal_bottom_sheet_body.dart';

class CustomSupplierListTile extends StatelessWidget {
  const CustomSupplierListTile({
    super.key,
    required this.supplierModel,
  });
  final SupplierModel supplierModel;

  @override
  Widget build(BuildContext context) {
    final GlobalKey btnKey = GlobalKey();
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppColors.kThirdColor,
          width: 1,
        ),
      ),
      title: Text(
        supplierModel.name,
        style: AppTextStyles.title20KThirdColorBold,
      ),
      subtitle: Text(
        DateFormat('yyyy-MM-dd').format(supplierModel.createdAt!),
        style: AppTextStyles.title16White70,
      ),
      trailing: DeleteAndEditMenuButton(
        btnKey: btnKey,
        iconColor: AppColors.kThirdColor,
        onDeleteTap: () {
          context.read<SuppliersCubit>().deleteSupplier(id: supplierModel.id);
        },
        onEditTap: () {
          log(btnKey.toString());
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
                create: (context) => EditSupplierCubit(supplier: supplierModel),
                child: EditSupplierModalBottomSheetBody(
                    supplierModel: supplierModel),
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
            return SupplierDetailsModalBottomSheetBody(
              supplierModel: supplierModel,
            );
          },
        );
      },
    );
  }
}
