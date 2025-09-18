import 'package:bloc/bloc.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/customers/models/customer_model.dart';
import 'package:meta/meta.dart';
part 'customers_state.dart';

class CustomersCubit extends Cubit<CustomersState> {
  CustomersCubit() : super(CustomersInitial()) {
    getSuppliers();
  }

  //
  List<CustomerModel> customers = [];
  List<CustomerModel> filteredCustomers = [];

  // get suppliers
  getSuppliers() async {
    try {
      emit(GetCustomersLoading());
      final response = await getData(tableName: 'customers');
      customers = response.map((e) => CustomerModel.fromJson(e)).toList();
      filteredCustomers = customers;
      emit(GetCustomersSuccess());
    } on Exception catch (e) {
      emit(GetCustomersFailure(message: e.toString()));
    }
  }

  // search Customers
  searchCustomers(String query) {
    filteredCustomers = customers
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(GetCustomersSuccess());
  }
}
