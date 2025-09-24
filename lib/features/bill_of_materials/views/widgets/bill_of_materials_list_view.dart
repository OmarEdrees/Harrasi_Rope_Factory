import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/veiw_models/bill_of_materials_cubit/bill_of_materials_cubit.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/bill_of_materials_list_tile.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/custom_empty_list.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/loading_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BillOfMaterialsListView extends StatelessWidget {
  const BillOfMaterialsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillOfMaterialsCubit, BillOfMaterialsState>(
      builder: (context, state) {
        final cubit = context.read<BillOfMaterialsCubit>();

        if (state is GetBillOfMaterialsLoading) {
          return Center(
            child: LoadingAnimationWidget.flickr(
              leftDotColor: AppColors.kSecondaryColor,
              rightDotColor: AppColors.kThirdColor,
              size: SizeConfig.height * 0.05,
            ),
          );
        }

        if (state is GetBillOfMaterialsFailure) {
          return CustomFailureMessage(message: state.errorMessage);
        }

        if (cubit.filterBillOfMaterials.isEmpty) {
          return const CustomEmptyList();
        }

        return LoadingOverlay(
          isLoading: state is DeleteBillOfMaterialLoading,
          child: RefreshIndicator(
            onRefresh: () async => await cubit.getBillOfMaterials(),
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: cubit.filterBillOfMaterials.length,
              separatorBuilder: (context, index) => SizedBox(
                height: SizeConfig.height * 0.015,
              ),
              itemBuilder: (context, index) {
                final bill = cubit.filterBillOfMaterials[index];
                return BillOfMaterialsListTile(
                  key: ValueKey(bill.id),
                  billOfMaterialModel: bill,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
