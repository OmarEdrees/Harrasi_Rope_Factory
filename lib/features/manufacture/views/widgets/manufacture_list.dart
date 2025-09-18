import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/manufacture/models/manufacture_model.dart';
import 'package:harrasi_rope_factory/features/manufacture/views/widgets/manufactuer_list_tile.dart';

class ManufactureList extends StatelessWidget {
  const ManufactureList({
    super.key,
    required this.manufactureItems,
  });

  final List<ManufactureModel> manufactureItems;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              ManufactureListTile(
                manufactureModel: manufactureItems[index],
              ),
              if (index < manufactureItems.length - 1)
                SizedBox(
                  height: SizeConfig.height * 0.015,
                )
            ],
          );
        },
        childCount: manufactureItems.length,
      ),
    );
  }
}
