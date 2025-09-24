import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/suppliers/view_models/suppliers/suppliers_cubit.dart';
import 'package:harrasi_rope_factory/features/suppliers/views/widgets/custom_supplier_list_tile.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/custom_empty_list.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/loading_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SuppliersSliverListView extends StatelessWidget {
  const SuppliersSliverListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuppliersCubit, SuppliersState>(
      builder: (context, state) {
        final cubit = context.read<SuppliersCubit>();

        if (state is GetSuppliersLoading) {
          return Center(
            child: LoadingAnimationWidget.flickr(
              leftDotColor: AppColors.kSecondaryColor,
              rightDotColor: AppColors.kThirdColor,
              size: SizeConfig.height * 0.05,
            ),
          );
        }

        if (state is GetSuppliersFailure) {
          return CustomFailureMessage(message: state.message);
        }

        if (cubit.filteredSuppliers.isEmpty) {
          return const CustomEmptyList();
        }

        return LoadingOverlay(
          isLoading: state is DeleteSupplierLoading,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final supplier = cubit.filteredSuppliers[index];
                    return Column(
                      children: [
                        CustomSupplierListTile(
                          key: ValueKey(supplier.id),
                          supplierModel: supplier,
                        ),
                        if (index < cubit.filteredSuppliers.length - 1)
                          SizedBox(height: SizeConfig.height * 0.015),
                      ],
                    );
                  },
                  childCount: cubit.filteredSuppliers.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
