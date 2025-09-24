import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/models/bom_item.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/views/widgets/bom_item_list_tile.dart';

class BomItemsListView extends StatelessWidget {
  const BomItemsListView({
    required this.bomItems,
    super.key,
  });
  final List<BOMItemModel> bomItems;
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return BomItemListTile(bomItemModel: bomItems[index]);
      },
      separatorBuilder: (context, index) => Divider(color: Colors.white24),
      itemCount: bomItems.length,
    );
  }
}
