import 'package:bloc/bloc.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data.dart';
import 'package:harrasi_rope_factory/core/network/supabase/database/get_data_with_spacific_id.dart';
import 'package:harrasi_rope_factory/features/manufacture/models/manufacture_model.dart';
import 'package:harrasi_rope_factory/features/products/models/product_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'manufacture_items_state.dart';

class ManufactureItemsCubit extends Cubit<ManufactureItemsState> {
  ManufactureItemsCubit() : super(ManufactureItemsInitial()) {
    getManufactureItems();
  }
  List<ManufactureModel> manufactureItems = [];
  List<ManufactureModel> filteredManufactureItems = [];
  getManufactureItems() async {
    try {
      emit(GetManufactureItemsLoading());
      final response = await getData(tableName: 'manufacturing_orders');
      final fetchedManufactureItems = (response as List)
          .map<ManufactureModel>(
              (e) => ManufactureModel.fromJson(e as Map<String, dynamic>))
          .toList();

      final updatedItems = await Future.wait<ManufactureModel>(
        fetchedManufactureItems.map((item) async {
          try {
            final rawMaterialResponse = await getDataWithSpacificId(
              tableName: "products",
              id: item.productId.toString(),
              primaryKey: "id",
            );

            return item.copyWith(
              product: ProductModel.fromJson(rawMaterialResponse[0]),
            );
          } catch (e) {
            return item;
          }
        }),
      );

      manufactureItems = updatedItems.map((item) => item).toList();
      filteredManufactureItems = manufactureItems;
      emit(GetManufactureItemsSuccess());
    } catch (e) {
      emit(GetManufactureItemsFailure(message: e.toString()));
    }
  }

  //delete Manufacture Item
  deleteManufactureItem({required String id}) async {
    try {
      emit(DeleteManufactureItemLoading());
      await getIt<SupabaseClient>()
          .from('manufacturing_orders')
          .delete()
          .match({'id': id}).select();
      emit(DeleteManufactureItemSuccess());
    } catch (e) {
      emit(DeleteManufactureItemFailure(message: e.toString()));
    }
  }
}
