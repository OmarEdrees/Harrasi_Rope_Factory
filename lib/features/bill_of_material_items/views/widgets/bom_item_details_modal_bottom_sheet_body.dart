import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/models/bom_item.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/details_list_tile.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class BomItemDetailsModalBottomSheetBody extends StatelessWidget {
  const BomItemDetailsModalBottomSheetBody({
    super.key,
    required this.bomItemModel,
  });

  final BOMItemModel bomItemModel;

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
                        title: LocaleKeys
                            .bill_of_materials_item_CustomTitle_title
                            .tr())),
                SizedBox(height: SizeConfig.height * 0.03),
                DetailsListTile(
                  title: LocaleKeys.products_product_details_ID.tr(),
                  value: bomItemModel.id,
                  icon: Icons.tag, // Material Icon: Represents an identifier
                ),
                DetailsListTile(
                  title: LocaleKeys.bill_of_materials_item_Bill_ID.tr(),
                  value: bomItemModel.bomId,
                  icon: Icons
                      .list_alt, // Material Icon: Represents a BOM reference
                ),
                DetailsListTile(
                  title: LocaleKeys.bill_of_materials_item_Raw_ID.tr(),
                  value: bomItemModel.rawMaterialId,
                  icon: Icons
                      .inventory_2, // Material Icon: Represents a material identifier
                ),
                DetailsListTile(
                  title: LocaleKeys.bill_of_materials_item_Raw_Material.tr(),
                  value: bomItemModel.rawMaterialName ?? "No Name".tr(),
                  icon:
                      Icons.label, // Material Icon: Represents a material name
                ),
                DetailsListTile(
                  title: LocaleKeys.raw_materials_Unit.tr(),
                  value: bomItemModel.unit,
                  icon: Icons
                      .straighten, // Material Icon: Represents a unit of measure
                ),
                DetailsListTile(
                  title:
                      LocaleKeys.sales_invoices_add_sales_quantity_title.tr(),
                  value: bomItemModel.quantity.toString(),
                  icon: FontAwesomeIcons
                      .hashtag, // FontAwesome Icon: Represents a numerical quantity
                ),
                DetailsListTile(
                  title: LocaleKeys.products_product_details_Created_At.tr(),
                  value:
                      DateFormat('yyyy-MM-dd').format(bomItemModel.createdAt),
                  icon: CupertinoIcons
                      .clock, // Cupertino Icon: Represents creation time
                ),
                DetailsListTile(
                  title: LocaleKeys.products_product_details_Updated_At.tr(),
                  value:
                      DateFormat('yyyy-MM-dd').format(bomItemModel.updatedAt),
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
