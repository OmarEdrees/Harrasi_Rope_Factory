import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/customers/models/customer_model.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/details_list_tile.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class CustomerDetailsModalBottomSheetBody extends StatelessWidget {
  const CustomerDetailsModalBottomSheetBody({
    super.key,
    required this.customerModel,
  });

  final CustomerModel customerModel;

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
                            .customers_add_customer_Customer_Details
                            .tr())),
                SizedBox(height: SizeConfig.height * 0.03),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_ID.tr(),
                  value: customerModel.id,
                  icon: Icons.tag, // Material Icon: Represents an identifier
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Name.tr(),
                  value: customerModel.name,
                  icon:
                      Icons.person, // Material Icon: Represents a customer name
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Contact_Person.tr(),
                  value:
                      customerModel.contactPerson ?? "No Contact Person".tr(),
                  icon: Icons
                      .contact_page, // Material Icon: Represents a contact person
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Phone.tr(),
                  value: customerModel.phone ?? "No Phone".tr(),
                  icon: Icons.phone, // Material Icon: Represents a phone number
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Email.tr(),
                  value: customerModel.email ?? "No Email".tr(),
                  icon:
                      Icons.email, // Material Icon: Represents an email address
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Address.tr(),
                  value: customerModel.address ?? "No Address".tr(),
                  icon:
                      Icons.location_on, // Material Icon: Represents an address
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Tax_ID.tr(),
                  value: customerModel.taxId ?? "No Tax ID".tr(),
                  icon: Icons.receipt, // Material Icon: Represents a tax ID
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Payment_Terms.tr(),
                  value: customerModel.paymentTerms ?? "No Payment Terms".tr(),
                  icon: FontAwesomeIcons
                      .creditCard, // FontAwesome Icon: Represents payment methods
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Credit_Limit.tr(),
                  value: customerModel.creditLimit.toString(),
                  icon: FontAwesomeIcons
                      .dollarSign, // FontAwesome Icon: Represents a monetary value
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Balance.tr(),
                  value: customerModel.balance.toString(),
                  icon: FontAwesomeIcons
                      .balanceScale, // FontAwesome Icon: Represents a balance
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Notes.tr(),
                  value: customerModel.notes ?? "No Notes".tr(),
                  icon: Icons.note_alt, // Material Icon: Represents notes
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Created_At.tr(),
                  value: customerModel.createdAt != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(customerModel.createdAt!)
                      : LocaleKeys.suppliers_details_modal_No_Date.tr(),
                  icon: CupertinoIcons
                      .clock, // Cupertino Icon: Represents creation time
                ),
                DetailsListTile(
                  title: LocaleKeys.suppliers_details_modal_Updated_At.tr(),
                  value: customerModel.updatedAt != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(customerModel.updatedAt!)
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
