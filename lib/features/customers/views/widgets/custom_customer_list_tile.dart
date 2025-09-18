import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/customers/models/customer_model.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/customer-details_modal_bottom_sheet_body.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/delete_and_edit_menu_button.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class CustomCustomerListTile extends StatelessWidget {
  const CustomCustomerListTile({
    super.key,
    required this.customerModel,
  });
  final CustomerModel customerModel;

  @override
  Widget build(BuildContext context) {
    final GlobalKey btnKey = GlobalKey();
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.kPrimaryColor,
          builder: (context) {
            return CustomerDetailsModalBottomSheetBody(
              customerModel: customerModel,
            );
          },
        );
      },
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: AppColors.kThirdColor,
            width: 1,
          ),
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: AppColors.kPrimaryColor,
            builder: (context) {
              return CustomerDetailsModalBottomSheetBody(
                customerModel: customerModel,
              );
            },
          );
        },
        title: Text(
          customerModel.name,
          style: AppTextStyles.title20KThirdColorBold,
        ),
        subtitle: Text(
          customerModel.createdAt != null
              ? DateFormat('yyyy-MM-dd').format(customerModel.createdAt!)
              : LocaleKeys.suppliers_details_modal_No_Date.tr(),
          style: AppTextStyles.title16White70,
        ),
        trailing: DeleteAndEditMenuButton(
          btnKey: btnKey,
          iconColor: AppColors.kThirdColor,
        ),
      ),
    );
  }
}
