import 'package:bloc/bloc.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data_with_spacific_id.dart';
import 'package:harrasi_rope_factory/features/customers/models/customer_model.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/models/sale_model.dart';
import 'package:meta/meta.dart';

part 'sales_invoices_state.dart';

class SalesInvoicesCubit extends Cubit<SalesInvoicesState> {
  SalesInvoicesCubit() : super(SalesInvoicesInitial()) {
    getPerchasesInvoice();
  }
  List<SaleInvoiceModel> sales = [];
  List<SaleInvoiceModel> filteredSales = [];

  // Sales invoice
  getPerchasesInvoice() async {
    try {
      emit(GetSalesInvoicesLoading());
      final response = await getData(tableName: 'sales_invoices');
      final fetchedSalesInvoice = (response as List)
          .map<SaleInvoiceModel>(
              (e) => SaleInvoiceModel.fromJson(e as Map<String, dynamic>))
          .toList();
      final updatedItems = await Future.wait<SaleInvoiceModel>(
        fetchedSalesInvoice.map((item) async {
          try {
            final purchaseResponse = await getDataWithSpacificId(
              tableName: "customers",
              id: item.customerId.toString(),
              primaryKey: "id",
            );

            return item.copyWith(
              customer: CustomerModel.fromJson(purchaseResponse[0]),
            );
          } catch (e) {
            return item;
          }
        }),
      );

      sales = updatedItems;
      filteredSales = sales;
      emit(GetSalesInvoicesSuccess());
    } catch (e) {
      emit(GetSalesInvoicesFailure(message: e.toString()));
    }
  }

  searchSales(String query) {
    filteredSales = sales
        .where((element) =>
            element.customer!.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(GetSalesInvoicesSuccess());
  }
}
