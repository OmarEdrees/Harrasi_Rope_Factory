import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/models/bom_item.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/views/widgets/bom_item_details_modal_bottom_sheet_body.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class BomItemListTile extends StatelessWidget {
  const BomItemListTile({super.key, required this.bomItemModel});
  final BOMItemModel bomItemModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppColors.kThirdColor,
          width: 1,
        ),
      ),
      title: Text(
        bomItemModel.rawMaterialName ??
            LocaleKeys.bill_of_materials_item_Item.tr(),
        style: AppTextStyles.title20KThirdColorBold,
      ),
      subtitle: Text(
        '${bomItemModel.quantity} ${bomItemModel.unit}',
        style: AppTextStyles.title16White70,
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.kPrimaryColor,
          builder: (context) {
            return BomItemDetailsModalBottomSheetBody(
              bomItemModel: bomItemModel,
            );
          },
        );
      },
    );
  }
}
