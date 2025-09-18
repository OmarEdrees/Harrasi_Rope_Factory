import 'package:bloc/bloc.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/suppliers/models/supplier_model.dart';
import 'package:meta/meta.dart';

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
  // search suppliers
  searchSuppliers(String query) {
    filteredSuppliers = suppliers
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(GetSuppliersSuccess());
  }
}

