import 'package:bloc/bloc.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/models/bill_of_material_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'bill_of_materials_state.dart';

class BillOfMaterialsCubit extends Cubit<BillOfMaterialsState> {
  BillOfMaterialsCubit() : super(BillOfMaterialsInitial()) {
    getBillOfMaterials();
  }
  List<BillOfMaterialModel> billOfMaterials = [];
  List<BillOfMaterialModel> filterBillOfMaterials = [];
  getBillOfMaterials() async {
    try {
      emit(GetBillOfMaterialsLoading());
      final response = await getData(tableName: 'bill_of_materials');
      billOfMaterials =
          response.map((e) => BillOfMaterialModel.fromJson(e)).toList();
      filterBillOfMaterials = billOfMaterials;
      emit(GetBillOfMaterialsSuccess());
    } catch (e) {
      emit(GetBillOfMaterialsFailure(errorMessage: e.toString()));
    }
  }

  // delete
  deleteBillOfMaterial({required String id}) async {
    try {
      emit(DeleteBillOfMaterialLoading());
      await getIt<SupabaseClient>().from('bill_of_materials').delete().eq('id', id);
      emit(DeleteBillOfMaterialSuccess());
    } catch (e) {
      emit(DeleteBillOfMaterialFailure(errorMessage: e.toString()));
    }
  }

  // search
  searchForBillOfMaterials({required String query}) async {
    filterBillOfMaterials = billOfMaterials
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(GetBillOfMaterialsSuccess());
  }
}
