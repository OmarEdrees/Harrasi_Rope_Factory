import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/widgets/custom_empty_list.dart';
import 'package:harrasi_rope_factory/features/customers/models/customer_model.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/custom_customer_list_tile.dart';

class CustomersSliverListview extends StatelessWidget {
  const CustomersSliverListview({
    required this.customers,
    super.key,
  });
  final List<CustomerModel> customers;

  @override
  Widget build(BuildContext context) {
    if (customers.isEmpty) {
      return SliverToBoxAdapter(
        child: CustomEmptyList(),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              CustomCustomerListTile(
                customerModel: customers[index],
              ),
              if (index < customers.length - 1)
                SizedBox(height: SizeConfig.height * 0.015),
            ],
          );
        },
        childCount: customers.length,
      ),
    );
  }
}
