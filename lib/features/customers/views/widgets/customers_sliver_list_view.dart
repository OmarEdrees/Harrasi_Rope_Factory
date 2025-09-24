import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/customers/view_models/customer/customers_cubit.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/custom_customer_list_tile.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/custom_empty_list.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_failure_message.dart';
import 'package:harrasi_rope_factory/features/categories/views/widgets/loading_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomersSliverListView extends StatelessWidget {
  const CustomersSliverListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomersCubit, CustomersState>(
      builder: (context, state) {
        final cubit = context.read<CustomersCubit>();

        if (state is GetCustomersLoading) {
          return Center(
            child: LoadingAnimationWidget.flickr(
              leftDotColor: AppColors.kSecondaryColor,
              rightDotColor: AppColors.kThirdColor,
              size: SizeConfig.height * 0.05,
            ),
          );
        }

        if (state is GetCustomersFailure) {
          return CustomFailureMessage(message: state.message);
        }

        if (cubit.filteredCustomers.isEmpty) {
          return const CustomEmptyList();
        }

        return LoadingOverlay(
          isLoading: state is DeleteCustomerLoading,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final customer = cubit.filteredCustomers[index];
                    return Column(
                      children: [
                        CustomCustomerListTile(
                          key: ValueKey(customer.id),
                          customerModel: customer,
                        ),
                        if (index < cubit.filteredCustomers.length - 1)
                          SizedBox(height: SizeConfig.height * 0.015),
                      ],
                    );
                  },
                  childCount: cubit.filteredCustomers.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
