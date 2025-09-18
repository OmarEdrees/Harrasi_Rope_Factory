import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/add_customer_float_action_button.dart';
import 'package:harrasi_rope_factory/features/customers/views/widgets/customer_screen_body.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomersScreenBody(),
      floatingActionButton: AddCustomerFloatActionButton(),
    );
  }
}


