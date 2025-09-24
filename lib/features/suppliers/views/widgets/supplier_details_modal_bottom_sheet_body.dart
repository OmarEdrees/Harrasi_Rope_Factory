import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/details_list_tile.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/features/suppliers/models/supplier_model.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class SupplierDetailsModalBottomSheetBody extends StatelessWidget {
  const SupplierDetailsModalBottomSheetBody({
    super.key,
    required this.supplierModel,
  });

  final SupplierModel supplierModel;

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
                            .suppliers_details_modal_customTitle_title
                            .tr())),
                SizedBox(height: SizeConfig.height * 0.03),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_ID.tr(),
                  value: supplierModel.id,
                  icon: Icons.tag, // Material Icon: Represents an identifier
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Name.tr(),
                  value: supplierModel.name,
                  icon: Icons
                      .business, // Material Icon: Represents a supplier name
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Contact_Person.tr(),
                  value:
                      supplierModel.contactPerson ?? "No Contact Person".tr(),
                  icon: Icons
                      .contact_page, // Material Icon: Represents a contact person
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Phone.tr(),
                  value: supplierModel.phone ?? "No Phone".tr(),
                  icon: Icons.phone, // Material Icon: Represents a phone number
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Email.tr(),
                  value: supplierModel.email ?? "No Email".tr(),
                  icon:
                      Icons.email, // Material Icon: Represents an email address
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Address.tr(),
                  value: supplierModel.address ?? "No Address".tr(),
                  icon:
                      Icons.location_on, // Material Icon: Represents an address
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Tax_ID.tr(),
                  value: supplierModel.taxId ?? "No Tax ID".tr(),
                  icon: Icons.receipt, // Material Icon: Represents a tax ID
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Payment_Terms.tr(),
                  value: supplierModel.paymentTerms ?? "No Payment Terms".tr(),
                  icon: FontAwesomeIcons
                      .creditCard, // FontAwesome Icon: Represents payment methods
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Credit_Limit.tr(),
                  value: supplierModel.creditLimit.toString(),
                  icon: FontAwesomeIcons
                      .dollarSign, // FontAwesome Icon: Represents a monetary value
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Balance.tr(),
                  value: supplierModel.balance.toString(),
                  icon: FontAwesomeIcons
                      .balanceScale, // FontAwesome Icon: Represents a balance
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Notes.tr(),
                  value: supplierModel.notes ?? "No Notes".tr(),
                  icon: Icons.note_alt, // Material Icon: Represents notes
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Created_At.tr(),
                  value: supplierModel.createdAt != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(supplierModel.createdAt!)
                      : LocaleKeys.suppliers_details_modal_No_Date.tr(),
                  icon: CupertinoIcons
                      .clock, // Cupertino Icon: Represents creation time
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Updated_At.tr(),
                  value: supplierModel.updatedAt != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(supplierModel.updatedAt!)
                      : LocaleKeys.suppliers_details_modal_No_Date.tr(),
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
