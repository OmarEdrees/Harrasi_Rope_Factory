import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/view_models/add_bil_of_material_items_cubit/add_bill_of_material_items_cubit.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/views/widgets/add_bill_of_material_item_modal_bottom_sheet.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/models/bill_of_material_model.dart';

class AddBillOfMaterialItemFloatActionButton extends StatelessWidget {
  const AddBillOfMaterialItemFloatActionButton({
    super.key,
    required this.billOfMaterial,
  });

  final BillOfMaterialModel billOfMaterial;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: AppColors.kThirdColor,
        child: Icon(Icons.add, color: AppColors.kPrimaryColor),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: AppColors.kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36),
                topRight: Radius.circular(36),
              ),
            ),
            builder: (context) {
              return BlocProvider(
                create: (context) => AddBillOfMaterialItemsCubit(
                  billOfMaterialModel: billOfMaterial,
                ),
                child: AddBillOfMaterialItemModalBottomSheet(),
              );
            },
          );
        });
  }
}
