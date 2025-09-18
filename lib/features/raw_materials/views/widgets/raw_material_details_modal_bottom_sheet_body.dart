import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/details_list_tile.dart';
import 'package:harrasi_rope_factory/features/raw_materials/models/raw_material_model.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class RawMaterialDetailsModalBottomSheetBody extends StatelessWidget {
  const RawMaterialDetailsModalBottomSheetBody({
    super.key,
    required this.rawMaterialModel,
  });

  final RawMaterialModel rawMaterialModel;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: true,
      initialChildSize: 0.93,
      maxChildSize: 0.93,
      minChildSize: 0.93,
      shouldCloseOnMinExtent: true,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * 0.03,
              vertical: SizeConfig.height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: CustomTitle(
                        title:
                            LocaleKeys.raw_materials_customTitle_title.tr())),
                SizedBox(height: SizeConfig.height * 0.03),
                DetailsListTile(
                  title: LocaleKeys.expenses_category_details_modal_ID.tr(),
                  value: rawMaterialModel.id,
                  icon: Icons.tag, // Material Icon: Represents an identifier
                ),
                DetailsListTile(
                  title: LocaleKeys.expenses_category_details_modal_Name.tr(),
                  value: rawMaterialModel.name,
                  icon:
                      Icons.label, // Material Icon: Represents a material name
                ),
                DetailsListTile(
                  title: LocaleKeys.expenses_category_details_modal_Description
                      .tr(),
                  value: rawMaterialModel.description.isEmpty
                      ? LocaleKeys
                          .expenses_category_details_modal_No_Description
                          .tr()
                      : rawMaterialModel.description,
                  icon: Icons
                      .description, // Material Icon: Represents a description
                ),
                DetailsListTile(
                  title: LocaleKeys.raw_materials_Unit.tr(),
                  value: rawMaterialModel.unit,
                  icon: Icons
                      .straighten, // Material Icon: Represents a unit of measure
                ),
                DetailsListTile(
                  title: LocaleKeys.raw_materials_Current_Stock.tr(),
                  value: rawMaterialModel.currentStock.toString(),
                  icon: FontAwesomeIcons
                      .boxesStacked, // FontAwesome Icon: Represents stock or inventory
                ),
                DetailsListTile(
                  title: LocaleKeys.expenses_category_details_modal_Created_At
                      .tr(),
                  value: DateFormat('yyyy-MM-dd')
                      .format(rawMaterialModel.createdAt),
                  icon: CupertinoIcons
                      .clock, // Cupertino Icon: Represents creation time
                ),
                DetailsListTile(
                  title: LocaleKeys.expenses_category_details_modal_Updated_At
                      .tr(),
                  value: DateFormat('yyyy-MM-dd')
                      .format(rawMaterialModel.updatedAt),
                  icon: CupertinoIcons
                      .refresh, // Cupertino Icon: Represents updates
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
