import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/helper/sale_invoice_services.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/purchases_invoices/views/widgets/invoice_pop_up_menu.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/models/sale_model.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/views/widgets/sale_invoice_details_modal_bottom_sheet_body.dart';

class CustomSaleInvoiceListTile extends StatelessWidget {
  const CustomSaleInvoiceListTile({
    super.key,
    required this.saleInvoiceModel,
  });
  final SaleInvoiceModel saleInvoiceModel;
  @override
  Widget build(BuildContext context) {
    final btnKey = GlobalKey();
    return ListTile(
      onTap: () async {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.kPrimaryColor,
          builder: (context) {
            return SaleInvoiceDetailsModalBottomSheetBody(
              saleInvoiceModel: saleInvoiceModel,
            );
          },
        );
      },
      title: Text(
        saleInvoiceModel.customer!.name,
        style: AppTextStyles.title20KThirdColorBold,
      ),
      subtitle: Text(
        "Due Date: ${DateFormat('yyyy-MM-dd').format(saleInvoiceModel.dueDate!)}",
        style: AppTextStyles.title16White70,
      ),
      trailing: InvoicePopUpMenuButton(
        btnKey: btnKey,
        iconColor: AppColors.kThirdColor,
        onShareTap: () async {
          await SaleInvoiceServices.generateAndSharePdf(
              model: saleInvoiceModel);
        },
        onPrintTap: () async {
          await SaleInvoiceServices.printInvoice(model: saleInvoiceModel);
        },
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppColors.kThirdColor,
          width: 1,
        ),
      ),
    );
  }
}
