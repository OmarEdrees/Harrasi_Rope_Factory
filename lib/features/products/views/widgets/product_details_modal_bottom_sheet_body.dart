import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/utilies/assets/images/app_images.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/details_list_tile.dart';
import 'package:harrasi_rope_factory/features/products/models/product_model.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class ProductDetailsModalBottomSheetBody extends StatelessWidget {
  const ProductDetailsModalBottomSheetBody({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

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
                            .products_product_details_customTitle_title
                            .tr())),
                SizedBox(height: SizeConfig.height * 0.03),
                if (productModel.image != null &&
                    productModel.image!.isNotEmpty)
                  Center(
                    child: SizedBox(
                      height: SizeConfig.height * 0.2,
                      width: SizeConfig.width * 0.5,
                      child: Image.network(
                        productModel.image!,
                        fit: BoxFit.contain,
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
                  value: productModel.id,
                  icon: Icons.tag, // Material Icon: Represents an identifier
                ),
                DetailsListTile(
                  title: LocaleKeys.products_product_details_Name.tr(),
                  value: productModel.name,
                  icon: Icons.label, // Material Icon: Represents a product name
                ),
                DetailsListTile(
                  title: LocaleKeys.products_product_details_Category_ID.tr(),
                  value: productModel.categoryId,
                  icon: Icons.category, // Material Icon: Represents a category
                ),
                DetailsListTile(
                  title: LocaleKeys.products_product_details_Description.tr(),
                  value: productModel.description.isEmpty
                      ? LocaleKeys.products_product_details_No_Description.tr()
                      : productModel.description,
                  icon: Icons
                      .description, // Material Icon: Represents a description
                ),
                DetailsListTile(
                  title:
                      LocaleKeys.products_product_details_Purchase_Price.tr(),
                  value: productModel.purchasePrice.toString(),
                  icon: FontAwesomeIcons
                      .dollarSign, // FontAwesome Icon: Represents a monetary value
                ),
                DetailsListTile(
                  title: LocaleKeys.products_product_details_Selling_Price.tr(),
                  value: productModel.sellingPrice.toString(),
                  icon: FontAwesomeIcons
                      .dollarSign, // FontAwesome Icon: Represents a monetary value
                ),
                DetailsListTile(
                  title: LocaleKeys.products_product_details_Manufactured.tr(),
                  value: productModel.isManufactured ? "Yes".tr() : "No".tr(),
                  icon: Icons
                      .build, // Material Icon: Represents manufacturing status
                ),
                DetailsListTile(
                  title: LocaleKeys.products_product_details_Unit.tr(),
                  value: productModel.unit,
                  icon: Icons
                      .straighten, // Material Icon: Represents a unit of measure
                ),
                DetailsListTile(
                  title: LocaleKeys.products_product_details_Minimum_Stock.tr(),
                  value: productModel.minStockLevel.toString(),
                  icon: FontAwesomeIcons
                      .boxesStacked, // FontAwesome Icon: Represents stock levels
                ),
                DetailsListTile(
                  title: LocaleKeys.products_product_details_Current_Stock.tr(),
                  value: productModel.currentStock.toString(),
                  icon: FontAwesomeIcons
                      .boxesStacked, // FontAwesome Icon: Represents stock levels
                ),
                DetailsListTile(
                  title: LocaleKeys.products_product_details_Created_At.tr(),
                  value:
                      DateFormat('yyyy-MM-dd').format(productModel.createdAt),
                  icon: CupertinoIcons
                      .clock, // Cupertino Icon: Represents creation time
                ),
                DetailsListTile(
                  title: LocaleKeys.products_product_details_Updated_At.tr(),
                  value:
                      DateFormat('yyyy-MM-dd').format(productModel.updatedAt),
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
