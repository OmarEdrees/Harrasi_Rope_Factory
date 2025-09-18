import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/app_route/route_names.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/models/bill_of_material_model.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/delete_and_edit_menu_button.dart';

class BillOfMaterialsListTile extends StatelessWidget {
  const BillOfMaterialsListTile({
    super.key,
    required this.billOfMaterialModel,
  });

  final BillOfMaterialModel billOfMaterialModel;

  @override
  Widget build(BuildContext context) {
    final GlobalKey btnKey = GlobalKey();
    return ListTile(
      onTap: () {
        context.pushScreen(RouteNames.billOfMaterialItemsScreen,
            arguments: billOfMaterialModel.toJson());
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppColors.kThirdColor,
          width: 1,
        ),
      ),
      title: Text(
        billOfMaterialModel.name,
        style: AppTextStyles.title20KThirdColorBold,
        maxLines: 1,
      ),
      subtitle: Text(
        billOfMaterialModel.description,
        style: AppTextStyles.title16White70,
        maxLines: 2,
      ),
      trailing: DeleteAndEditMenuButton(
        btnKey: btnKey,
        iconColor: AppColors.kThirdColor,
      ),
    );
  }
}
