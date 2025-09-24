import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data_with_spacific_id.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/models/bom_item.dart';
import 'package:meta/meta.dart';

part 'bill_of_material_items_state.dart';

class BillOfMaterialItemsCubit extends Cubit<BillOfMaterialItemsState> {
  BillOfMaterialItemsCubit({required this.billOfMaterialId})
      : super(BillOfMaterialItemsInitial()) {
    getBillOfMaterialItems();
  }

  final String billOfMaterialId;
  List<BOMItemModel> items = [];
  List<BOMItemModel> filterItems = [];

  Future<void> getBillOfMaterialItems() async {
    try {
      emit(GetBillOfMaterialItemsLoading());
      final response = await getDataWithSpacificId(
        tableName: "bom_items",
        id: billOfMaterialId,
        primaryKey: "bom_id",
      );
      final fetchedItems = (response as List)
          .map<BOMItemModel>(
              (e) => BOMItemModel.fromJson(e as Map<String, dynamic>))
          .toList();

      final updatedItems = await Future.wait<BOMItemModel>(
        fetchedItems.map((item) async {
          try {
            final rawMaterialResponse = await getDataWithSpacificId(
              tableName: "raw_materials",
              id: item.rawMaterialId.toString(),
              primaryKey: "id",
            );

            return item.copyWith(
              rawMaterialName: rawMaterialResponse[0]['name'],
            );
          } catch (e) {
            log('Error fetching raw material for item ${item.rawMaterialId}: $e');
            return item;
          }
        }),
      );

      items = updatedItems;
      filterItems = List.from(items);
      emit(GetBillOfMaterialItemsSuccess());
    } catch (e) {
      emit(GetBillOfMaterialItemsFailure(errorMessage: e.toString()));
    }
  }

  void searchForItems(String query) {
    if (query.isEmpty) {
      filterItems = List.from(items);
    } else {
      filterItems = items
          .where((element) => (element.rawMaterialName ?? "")
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
    emit(GetBillOfMaterialItemsSuccess());
  }
}
