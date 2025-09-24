import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/view_models/add_sale_invoice_cubit/add_sale_invoice_cubit.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/views/widgets/add_sales_invoice_modal_bottom_sheet_body.dart';

class AddSalesInvoiceFloatActionButton extends StatelessWidget {
  const AddSalesInvoiceFloatActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.kThirdColor,
      child: Icon(
        Icons.add,
        color: AppColors.kPrimaryColor,
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            ),
          ),
          builder: (context) => BlocProvider(
            create: (context) => AddSaleInvoiceCubit(),
            child: AddSalesInvoiceModalBottomSheetBody(),
          ),
        );
      },
    );
  }
}
