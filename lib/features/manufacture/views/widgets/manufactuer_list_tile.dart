import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/manufacture/models/manufacture_model.dart';
import 'package:harrasi_rope_factory/features/manufacture/view_models/edit_manufacture_cubit/edit_manufacture_cubit.dart';
import 'package:harrasi_rope_factory/features/manufacture/views/widgets/edit_manufacture_modal_bottom_sheet_body.dart';
import 'package:harrasi_rope_factory/features/manufacture/views/widgets/manufacture_details_modal_bottom_sheet_body.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/delete_and_edit_menu_button.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class ManufactureListTile extends StatelessWidget {
  const ManufactureListTile({
    super.key,
    required this.manufactureModel,
  });

  final ManufactureModel manufactureModel;

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
        manufactureModel.product?.name ??
            LocaleKeys.manufacture_No_Product.tr(),
        style: AppTextStyles.title20KThirdColorBold,
      ),
      subtitle: Text(
        manufactureModel.endDate != null
            ? "End Date: ${DateFormat('dd/MM/yyyy').format(manufactureModel.endDate!)}"
            : "No End Date".tr(),
        style: AppTextStyles.title16White70,
      ),
      trailing: DeleteAndEditMenuButton(
        btnKey: btnKey,
        iconColor: AppColors.kThirdColor,
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
                    EditManufactureCubit(manufacture: manufactureModel),
                child: EditManufactureModalBottomSheetBody(
                  manufactureModel: manufactureModel,
                ),
              );
            },
          );
        },
        onDeleteTap: () {},
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.kPrimaryColor,
          builder: (context) {
            return ManufactureDetailsModalBottomSheetBody(
              manufactureModel: manufactureModel,
            );
          },
        );
      },
    );
  }
}
