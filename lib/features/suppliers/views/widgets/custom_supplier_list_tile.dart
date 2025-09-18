import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/delete_and_edit_menu_button.dart';
import 'package:harrasi_rope_factory/features/suppliers/models/supplier_model.dart';
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
