import 'package:harrasi_rope_factory/features/products/models/product_model.dart';

class SalesInvoiceItem {
  ProductModel product;
  double quantity;
  double unitPrice;
  double total;

  SalesInvoiceItem({
    required this.product,
    this.quantity = 1,
  })  : unitPrice = product.sellingPrice,
        total = product.sellingPrice * quantity;

  Map<String, dynamic> toJson(String invoiceId) {
    return {
      "invoice_id": invoiceId,
      "product_id": product.id,
      "description": product.description,
      "quantity": quantity,
      "unit_price": unitPrice,
      "total": total,
      "created_at": DateTime.now().toIso8601String(),
    };
  }
}
