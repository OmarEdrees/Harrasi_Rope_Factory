import 'package:harrasi_rope_factory/core/helper/purchase_invoice_scrvices.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/models/sale_model.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/views/widgets/sale_invoice_details_modal_bottom_sheet_body.dart';
import 'package:printing/printing.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/assets/images/app_images.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/purchases_invoices/views/widgets/invoice_pop_up_menu.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

class SaleInvoiceServices {
static    Future<void> printInvoice({required SaleInvoiceModel model}) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Center(
              child: pw.Text(
                "Sales Invoice\nInvoice Number: ${model.invoiceNumber}",
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Text("Date: ${model.date.toString().split(" ").first}"),
            pw.Text(
                "Due Date: ${model.dueDate?.toString().split(" ").first ?? "-"}"),
            pw.Text("Status: ${model.status}"),
            pw.Text("Payment Method: ${model.paymentMethod}"),
            pw.SizedBox(height: 20),
            pw.Text("Customer: ${model.customer!.name}"),
            pw.SizedBox(height: 20),
            pw.Table(
              border: pw.TableBorder.all(),
              children: [
                _buildRow("Subtotal", "${model.subtotal}"),
                _buildRow("Tax", "${model.tax}"),
                _buildRow("Discount", "${model.discount}"),
                _buildRow("Total", "${model.total}", isBold: true),
              ],
            ),
          ];
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

 static Future<void> generateAndSharePdf({required SaleInvoiceModel model}) async {
    final pdf = pw.Document();

    final imageLogo = pw.MemoryImage(
      (await rootBundle.load(AppImages.logoWithTitle)).buffer.asUint8List(),
    );

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(24),
        build: (pw.Context context) {
          return [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "Sales Invoice",
                      style: pw.TextStyle(
                        fontSize: 28,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.blue900,
                      ),
                    ),
                    pw.SizedBox(height: 8),
                    pw.Text("Invoice Number: ${model.invoiceNumber}",
                        style: const pw.TextStyle(fontSize: 14)),
                    pw.Text("Date: ${model.date.toString().split(" ").first}",
                        style: const pw.TextStyle(fontSize: 14)),
                    if (model.dueDate != null)
                      pw.Text(
                          "Due Date: ${model.dueDate.toString().split(" ").first}",
                          style: const pw.TextStyle(fontSize: 14)),
                    pw.Text("Status: ${model.status}",
                        style: const pw.TextStyle(fontSize: 14)),
                    pw.Text("Payment Method: ${model.paymentMethod}",
                        style: const pw.TextStyle(fontSize: 14)),
                  ],
                ),
                pw.Container(
                  height: 80,
                  width: 80,
                  child: pw.Image(imageLogo, fit: pw.BoxFit.contain),
                ),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Divider(),
            pw.SizedBox(height: 12),
            pw.Text(
              "Customer",
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.black,
              ),
            ),
            pw.SizedBox(height: 6),
            pw.Text(
              "Name: ${model.customer!.name}",
              style: const pw.TextStyle(fontSize: 14),
            ),
            pw.SizedBox(height: 20),
            pw.Table(
              border: pw.TableBorder.all(color: PdfColors.grey, width: 0.5),
              columnWidths: {
                0: const pw.FlexColumnWidth(3),
                1: const pw.FlexColumnWidth(1),
              },
              children: [
                pw.TableRow(
                  decoration: const pw.BoxDecoration(color: PdfColors.blue100),
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(
                        "Description",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(
                        "Amount",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                _buildRow("Subtotal", "${model.subtotal}"),
                _buildRow("Tax", "${model.tax}"),
                _buildRow("Discount", "${model.discount}"),
                _buildRow("Total", "${model.total}",
                    isBold: true, highlight: PdfColors.green100),
              ],
            ),
            pw.SizedBox(height: 30),
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Text(
                "Thank you for your business!",
                style: pw.TextStyle(
                  fontSize: 14,
                  fontStyle: pw.FontStyle.italic,
                  color: PdfColors.grey700,
                ),
              ),
            ),
          ];
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/sales_invoice.pdf");
    await file.writeAsBytes(await pdf.save());

    await Share.shareXFiles([XFile(file.path)], text: "Sales Invoice");
  }

static  pw.TableRow _buildRow(
    String label,
    String value, {
    bool isBold = false,
    PdfColor? highlight,
  }) {
    return pw.TableRow(
      decoration: pw.BoxDecoration(color: highlight),
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Text(
            label,
            style: pw.TextStyle(
              fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
            ),
          ),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Text(
            value,
            style: pw.TextStyle(
              fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

}