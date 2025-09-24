import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/helper/purchase_invoice_scrvices.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/purchases_invoices/models/purchase_model.dart';
import 'package:harrasi_rope_factory/features/purchases_invoices/views/widgets/invoice_pop_up_menu.dart';
import 'package:harrasi_rope_factory/features/purchases_invoices/views/widgets/purchase_invoice_details_modal_bottom_sheet_body.dart';

class CustomPurchaseListTile extends StatelessWidget {
  const CustomPurchaseListTile({
    super.key,
    required this.purchaseInvoiceModel,
  });
  final PurchaseInvoiceModel purchaseInvoiceModel;
  @override
  Widget build(BuildContext context) {
    final btnKey = GlobalKey();
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.kPrimaryColor,
          builder: (context) {
            return PurchaseInvoiceDetailsModalBottomSheetBody(
              purchaseInvoiceModel: purchaseInvoiceModel,
            );
          },
        );
      },
      title: Text(
        purchaseInvoiceModel.supplier!.name,
        style: AppTextStyles.title20KThirdColorBold,
      ),
      subtitle: Text(
        "Due Date: ${DateFormat('yyyy-MM-dd').format(purchaseInvoiceModel.dueDate!)}",
        style: AppTextStyles.title16White70,
      ),
      trailing: InvoicePopUpMenuButton(
        btnKey: btnKey,
        iconColor: AppColors.kThirdColor,
        onShareTap: () async {
          await PurchaseInvoiceScrvices.generateAndSharePdf(
              model: purchaseInvoiceModel);
        },
        onPrintTap: () async {
          await PurchaseInvoiceScrvices.printInvoice(model: purchaseInvoiceModel);
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
