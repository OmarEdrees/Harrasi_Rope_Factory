import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/app_route/route_names.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/extensions/app_extensions.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/models/bill_of_material_model.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/veiw_models/bill_of_materials_cubit/bill_of_materials_cubit.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/veiw_models/edit_bill_of_material_cubit/edit_bill_of_material_cubit.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/edit_bill_of_material_modal_bottom_sheet_body.dart';
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
        onDeleteTap: () {
          context.read<BillOfMaterialsCubit>().deleteBillOfMaterial(
            id: billOfMaterialModel.id,
          );
        },
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
                create: (context) => EditBillOfMaterialCubit(
                  billOfMaterial: billOfMaterialModel,
                ),
                child: EditBillOfMaterialModalBottomSheetBody(
                  billOfMaterial: billOfMaterialModel,
                ),
              );
            },
          );
        },
        iconColor: AppColors.kThirdColor,
      ),
    );
  }
}
