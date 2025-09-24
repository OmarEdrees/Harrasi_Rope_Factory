import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/categories/models/category_model.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/details_list_tile.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class CategoryDetailsModalBottomSheetBody extends StatelessWidget {
  const CategoryDetailsModalBottomSheetBody({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

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
                        title: LocaleKeys.categories_customTitle_title.tr())),
                SizedBox(height: SizeConfig.height * 0.03),
                DetailsListTile(
                  title: LocaleKeys.expenses_category_details_modal_ID.tr(),
                  value: categoryModel.id,
                  icon: Icons.tag, // Material Icon: Represents an identifier
                ),
                DetailsListTile(
                  title: LocaleKeys.expenses_category_details_modal_Name.tr(),
                  value: categoryModel.name,
                  icon:
                      Icons.label, // Material Icon: Represents a category name
                ),
                DetailsListTile(
                  title: LocaleKeys.expenses_category_details_modal_Description
                      .tr(),
                  value: categoryModel.description.isEmpty
                      ? LocaleKeys
                          .expenses_category_details_modal_No_Description
                          .tr()
                      : categoryModel.description,
                  icon: Icons
                      .description, // Material Icon: Represents a description
                ),
                DetailsListTile(
                  title: LocaleKeys.categories_Active.tr(),
                  value: categoryModel.active ? "Active".tr() : "Inactive".tr(),
                  icon: Icons
                      .toggle_on, // Material Icon: Represents a boolean status
                ),
                DetailsListTile(
                  title: LocaleKeys.expenses_category_details_modal_Created_At
                      .tr(),
                  value:
                      DateFormat('yyyy-MM-dd').format(categoryModel.createdAt),
                  icon: CupertinoIcons
                      .clock, // Cupertino Icon: Represents creation time
                ),
                DetailsListTile(
                  title: LocaleKeys.expenses_category_details_modal_Updated_At
                      .tr(),
                  value:
                      DateFormat('yyyy-MM-dd').format(categoryModel.updatedAt),
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
