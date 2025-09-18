import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/features/raw_materials/models/raw_material_model.dart';
import 'package:meta/meta.dart';

part 'raw_materials_state.dart';

class RawMaterialsCubit extends Cubit<RawMaterialsState> {
  RawMaterialsCubit() : super(RawMaterialsInitial()) {
    getMaterials();
  }
  List<RawMaterialModel> rawMaterials = [];
  List<RawMaterialModel> filteredRawMaterials = [];
  getMaterials() async {
    try {
      emit(GetRawMaterialsLoading());
      final response = await getData(tableName: "raw_materials");
      rawMaterials = response.map((e) => RawMaterialModel.fromJson(e)).toList();
      filteredRawMaterials = rawMaterials;
      emit(GetRawMaterialsSuccess());
    } catch (e) {
      emit(GetRawMaterialsError(error: e.toString()));
    }
  }

  searchMaterial(String query) {
    if (query.isEmpty) {
      filteredRawMaterials = rawMaterials;
    }
    filteredRawMaterials = rawMaterials
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(GetRawMaterialsSuccess());
  }
}
