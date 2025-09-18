import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/details_list_tile.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_title.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/models/sale_model.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class SaleInvoiceDetailsModalBottomSheetBody extends StatelessWidget {
  const SaleInvoiceDetailsModalBottomSheetBody({
    super.key,
    required this.saleInvoiceModel,
  });

  final SaleInvoiceModel saleInvoiceModel;

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
                            .sales_invoices_details_modal_customTitle_title
                            .tr())),
                SizedBox(height: SizeConfig.height * 0.03),
                DetailsListTile(
                  title: LocaleKeys.sales_invoices_details_modal_ID.tr(),
                  value: saleInvoiceModel.id,
                  icon: Icons.tag, // Material Icon: Represents an identifier
                ),
                DetailsListTile(
                  title: LocaleKeys.sales_invoices_details_modal_Invoice_Number
                      .tr(),
                  value: saleInvoiceModel.invoiceNumber.toString(),
                  icon: Icons
                      .receipt_long, // Material Icon: Represents an invoice number
                ),
                DetailsListTile(
                  title: LocaleKeys.sales_invoices_details_modal_Customer.tr(),
                  value: saleInvoiceModel.customer?.name ?? "No Customer".tr(),
                  icon: Icons.person, // Material Icon: Represents a customer
                ),
                DetailsListTile(
                  title:
                      LocaleKeys.sales_invoices_details_modal_Customer_ID.tr(),
                  value: saleInvoiceModel.customerId,
                  icon: Icons
                      .perm_identity, // Material Icon: Represents a customer identifier
                ),
                DetailsListTile(
                  title: LocaleKeys.sales_invoices_details_modal_Date.tr(),
                  value: DateFormat('yyyy-MM-dd').format(saleInvoiceModel.date),
                  icon: CupertinoIcons
                      .calendar, // Cupertino Icon: Represents a date
                ),
                DetailsListTile(
                  title: LocaleKeys.sales_invoices_details_modal_Due_Date.tr(),
                  value: saleInvoiceModel.dueDate != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(saleInvoiceModel.dueDate!)
                      : LocaleKeys.sales_invoices_details_modal_No_Due_Date
                          .tr(),
                  icon: CupertinoIcons
                      .calendar_today, // Cupertino Icon: Represents a due date
                ),
                DetailsListTile(
                  title: LocaleKeys.sales_invoices_details_modal_Status.tr(),
                  value: saleInvoiceModel.status,
                  icon: Icons.info, // Material Icon: Represents a status
                ),
                DetailsListTile(
                  title: LocaleKeys.sales_invoices_details_modal_Payment_Method
                      .tr(),
                  value: saleInvoiceModel.paymentMethod,
                  icon: FontAwesomeIcons
                      .creditCard, // FontAwesome Icon: Represents payment methods
                ),
                DetailsListTile(
                  title: LocaleKeys.sales_invoices_details_modal_Subtotal.tr(),
                  value: saleInvoiceModel.subtotal.toString(),
                  icon: FontAwesomeIcons
                      .dollarSign, // FontAwesome Icon: Represents a monetary value
                ),
                DetailsListTile(
                  title: LocaleKeys.sales_invoices_details_modal_Tax.tr(),
                  value: saleInvoiceModel.tax.toString(),
                  icon: Icons.account_balance, // Material Icon: Represents tax
                ),
                DetailsListTile(
                  title: LocaleKeys.sales_invoices_details_modal_Discount.tr(),
                  value: saleInvoiceModel.discount.toString(),
                  icon: FontAwesomeIcons
                      .tag, // FontAwesome Icon: Represents a discount
                ),
                DetailsListTile(
                  title: LocaleKeys.sales_invoices_details_modal_Total.tr(),
                  value: saleInvoiceModel.total.toString(),
                  icon: FontAwesomeIcons
                      .dollarSign, // FontAwesome Icon: Represents a monetary total
                ),
                DetailsListTile(
                  title: LocaleKeys.sales_invoices_details_modal_Notes.tr(),
                  value: saleInvoiceModel.notes ?? "No Notes".tr(),
                  icon: Icons.note_alt, // Material Icon: Represents notes
                ),
                DetailsListTile(
                  title:
                      LocaleKeys.sales_invoices_details_modal_Created_At.tr(),
                  value: DateFormat('yyyy-MM-dd')
                      .format(saleInvoiceModel.createdAt),
                  icon: CupertinoIcons
                      .clock, // Cupertino Icon: Represents creation time
                ),
                DetailsListTile(
                  title:
                      LocaleKeys.sales_invoices_details_modal_Updated_At.tr(),
                  value: DateFormat('yyyy-MM-dd')
                      .format(saleInvoiceModel.updatedAt),
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
