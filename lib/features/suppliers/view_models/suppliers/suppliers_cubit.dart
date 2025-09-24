import 'package:bloc/bloc.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/suppliers/models/supplier_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'suppliers_state.dart';

class SuppliersCubit extends Cubit<SuppliersState> {
  SuppliersCubit() : super(SuppliersInitial()) {
    getSuppliers();
  }

  //
  List<SupplierModel> suppliers = [];
  List<SupplierModel> filteredSuppliers = [];

  // get suppliers
  getSuppliers() async {
    try {
      emit(GetSuppliersLoading());
      final response = await getData(tableName: 'suppliers');
      suppliers = response.map((e) => SupplierModel.fromJson(e)).toList();
      filteredSuppliers = suppliers;
      emit(GetSuppliersSuccess());
    } on Exception catch (e) {
      emit(GetSuppliersFailure(message: e.toString()));
    }
  }

  // delete customer
  deleteSupplier({required String id}) async {
    try {
      emit(DeleteSupplierLoading());
      await getIt<SupabaseClient>().from('suppliers').delete().eq('id', id);
      emit(DeleteSupplierSuccess());
    } catch (e) {
      emit(DeleteSupplierFailure(message: e.toString()));
    }
  }

  // search suppliers
  searchSuppliers(String query) {
    filteredSuppliers = suppliers
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(GetSuppliersSuccess());
  }
}
