import 'package:bloc/bloc.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data_with_spacific_id.dart';
import 'package:harrasi_rope_factory/features/purchases_invoices/models/purchase_model.dart';
import 'package:harrasi_rope_factory/features/suppliers/models/supplier_model.dart';
import 'package:meta/meta.dart';

part 'purchases_state.dart';

class PurchasesCubit extends Cubit<PurchasesState> {
  PurchasesCubit() : super(PurchasesInitial()) {
    getPerchasesInvoice();
  }
  List<PurchaseInvoiceModel> purchases = [];
  List<PurchaseInvoiceModel> filteredPurchases = [];

  // purchases invoice
  getPerchasesInvoice() async {
    try {
      emit(GetPurchasesLoading());
      final response = await getData(tableName: 'purchase_invoices');
      final fetchedPurchasesInvoice = (response as List)
          .map<PurchaseInvoiceModel>(
              (e) => PurchaseInvoiceModel.fromJson(e as Map<String, dynamic>))
          .toList();

      final updatedItems = await Future.wait<PurchaseInvoiceModel>(
        fetchedPurchasesInvoice.map((item) async {
          try {
            final purchaseResponse = await getDataWithSpacificId(
              tableName: "suppliers",
              id: item.supplierId.toString(),
              primaryKey: "id",
            );
            return item.copyWith(
              supplier: SupplierModel.fromJson(purchaseResponse[0]),
            );
          } catch (e) {
            return item;
          }
        }),
      );

      purchases = updatedItems;
      filteredPurchases = purchases;
      emit(GetPurchasesSuccess());
    } catch (e) {
      emit(GetPurchasesFailure(message: e.toString()));
    }
  }

  searchPurchases(String query) {
    filteredPurchases = purchases
        .where((element) =>
            element.supplier!.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(GetPurchasesSuccess());
  }
}
