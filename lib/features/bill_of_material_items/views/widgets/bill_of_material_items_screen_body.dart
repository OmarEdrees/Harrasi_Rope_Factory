import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/view_models/bill_of_material_items/bill_of_material_items_cubit.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/views/widgets/bom_items.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/views/widgets/custom_divider.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/models/bill_of_material_model.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class BillOfMaterialItemsScreenBody extends StatelessWidget {
  const BillOfMaterialItemsScreenBody({
    super.key,
    required this.billOfMaterial,
  });

  final BillOfMaterialModel billOfMaterial;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BillOfMaterialItemsCubit(
        billOfMaterialId: billOfMaterial.id,
      ),
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.03,
          vertical: SizeConfig.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CustomTitle(title: billOfMaterial.name)),
            SizedBox(
              height: SizeConfig.height * 0.01,
            ),
            Text(
              LocaleKeys.bill_of_materials_item_Description.tr(),
              style: AppTextStyles.title20KThirdColorBold,
            ),
            Text(
              billOfMaterial.description,
              style: AppTextStyles.title18White70,
            ),
            CustomDivider(),
            BomItems()
          ],
        ),
      )),
    );
  }
}
