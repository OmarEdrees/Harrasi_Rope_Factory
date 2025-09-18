import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/utilies/assets/images/app_images.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/details_list_tile.dart';
import 'package:harrasi_rope_factory/features/manufacture/models/manufacture_model.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class ManufactureDetailsModalBottomSheetBody extends StatelessWidget {
  const ManufactureDetailsModalBottomSheetBody({
    super.key,
    required this.manufactureModel,
  });

  final ManufactureModel manufactureModel;

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
                            LocaleKeys.manufacture_Manufacture_Details.tr())),
                SizedBox(height: SizeConfig.height * 0.03),
                if (manufactureModel.product?.image != null &&
                    manufactureModel.product!.image!.isNotEmpty)
                  Center(
                    child: SizedBox(
                      height: SizeConfig.height * 0.2,
                      width: SizeConfig.width * 0.5,
                      child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          manufactureModel.product!.image!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                else
                  Center(
                    child: SizedBox(
                      height: SizeConfig.height * 0.2,
                      width: SizeConfig.width * 0.5,
                      child: Image.asset(
                        AppImages.noProductImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                SizedBox(height: SizeConfig.height * 0.03),
                DetailsListTile(
                  title: LocaleKeys.products_product_details_ID.tr(),
                  value: manufactureModel.id,
                  icon: Icons.tag, // Material Icon: Represents an identifier
                ),
                DetailsListTile(
                  title: LocaleKeys.sales_invoices_add_sales_product.tr(),
                  value: manufactureModel.product?.name ?? "No Product".tr(),
                  icon: Icons.label, // Material Icon: Represents a product name
                ),
                DetailsListTile(
                  title: LocaleKeys.manufacture_Product_ID.tr(),
                  value: manufactureModel.productId,
                  icon: Icons
                      .perm_identity, // Material Icon: Represents a product identifier
                ),
                DetailsListTile(
                  title: LocaleKeys.manufacture_BOM_ID.tr(),
                  value: manufactureModel.bomId,
                  icon: Icons
                      .list_alt, // Material Icon: Represents a bill of materials
                ),
                DetailsListTile(
                  title:
                      LocaleKeys.sales_invoices_add_sales_quantity_title.tr(),
                  value: manufactureModel.quantity.toString(),
                  icon: FontAwesomeIcons
                      .hashtag, // FontAwesome Icon: Represents a numerical quantity
                ),
                DetailsListTile(
                  title: LocaleKeys.manufacture_Status.tr(),
                  value: manufactureModel.status,
                  icon: Icons.info, // Material Icon: Represents a status
                ),
                DetailsListTile(
                  title: LocaleKeys.manufacture_Start_Date.tr(),
                  value: manufactureModel.startDate != null
                      ? DateFormat('dd/MM/yyyy')
                          .format(manufactureModel.startDate!)
                      : LocaleKeys.manufacture_No_Start_Date.tr(),
                  icon: CupertinoIcons
                      .calendar, // Cupertino Icon: Represents a start date
                ),
                DetailsListTile(
                  title: LocaleKeys.manufacture_End_Date.tr(),
                  value: manufactureModel.endDate != null
                      ? DateFormat('dd/MM/yyyy')
                          .format(manufactureModel.endDate!)
                      : LocaleKeys.manufacture_No_End_Date.tr(),
                  icon: CupertinoIcons
                      .calendar_today, // Cupertino Icon: Represents an end date
                ),
                DetailsListTile(
                  title: LocaleKeys.sales_invoices_add_sales_notes.tr(),
                  value: manufactureModel.notes ?? "No Notes".tr(),
                  icon: Icons.note_alt, // Material Icon: Represents notes
                ),
                DetailsListTile(
                  title: LocaleKeys.products_product_details_Created_At.tr(),
                  value: DateFormat('dd/MM/yyyy')
                      .format(manufactureModel.createdAt),
                  icon: CupertinoIcons
                      .clock, // Cupertino Icon: Represents creation time
                ),
                DetailsListTile(
                  title: LocaleKeys.products_product_details_Updated_At.tr(),
                  value: DateFormat('dd/MM/yyyy')
                      .format(manufactureModel.updatedAt),
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
