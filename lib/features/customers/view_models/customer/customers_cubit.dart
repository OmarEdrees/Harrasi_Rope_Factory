import 'package:bloc/bloc.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/customers/models/customer_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'customers_state.dart';

class CustomersCubit extends Cubit<CustomersState> {
  CustomersCubit() : super(CustomersInitial()) {
    getCustomers();
  }

  //
  List<CustomerModel> customers = [];
  List<CustomerModel> filteredCustomers = [];

  // get customers
  getCustomers() async {
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

  // delete customer
  deleteCustomer({required String id}) async {
    try {
      emit(DeleteCustomerLoading());
      await getIt<SupabaseClient>().from('customers').delete().eq('id', id);
      emit(DeleteCustomerSuccess());
    } catch (e) {
      emit(DeleteCustomerFailure(message: e.toString()));
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
