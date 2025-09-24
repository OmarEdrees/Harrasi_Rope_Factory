import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/app_route/route_names.dart';
import 'package:harrasi_rope_factory/features/auth/sign_in/view_models/cubit/sign_in_cubit.dart';
import 'package:harrasi_rope_factory/features/auth/sign_in/views/screens/sign_in_screen.dart';
import 'package:harrasi_rope_factory/features/auth/sign_up/view_models/cubit/sign_up_cubit.dart';
import 'package:harrasi_rope_factory/features/auth/sign_up/views/screens/sign_up_screen.dart';
import 'package:harrasi_rope_factory/features/bill_of_material_items/views/screens/bill_of_material_items_screen.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/veiw_models/bill_of_materials_cubit/bill_of_materials_cubit.dart';
import 'package:harrasi_rope_factory/features/bill_of_materials/views/screens/bill_of_materials_screen.dart';
import 'package:harrasi_rope_factory/features/categories/view_models/categories_cubit/categories_cubit.dart';
import 'package:harrasi_rope_factory/features/categories/views/screens/categories_screen.dart';
import 'package:harrasi_rope_factory/features/customers/view_models/customer/customers_cubit.dart';
import 'package:harrasi_rope_factory/features/customers/views/screens/customers_screen.dart';
import 'package:harrasi_rope_factory/features/dash_board/views/screens/home_screen.dart';
import 'package:harrasi_rope_factory/features/expenses/view_models/expenses_cubit/expenses_cubit.dart';
import 'package:harrasi_rope_factory/features/expenses/views/screens/expenses_screen_body.dart';
import 'package:harrasi_rope_factory/features/expenses_category/view_models/expenses_category_cubit/expenses_category_cubit.dart';
import 'package:harrasi_rope_factory/features/expenses_category/views/screens/expenses_caregory_screen.dart';
import 'package:harrasi_rope_factory/features/manufacture/view_models/manufacture_items_cubit/manufacture_items_cubit.dart';
import 'package:harrasi_rope_factory/features/manufacture/views/screens/manufacture_screen.dart';
import 'package:harrasi_rope_factory/features/on_boarding/views/screens/on_boarding_screen.dart';
import 'package:harrasi_rope_factory/features/products/view_models/products_cubit/products_cubit.dart';
import 'package:harrasi_rope_factory/features/products/views/screens/products_screeen.dart';
import 'package:harrasi_rope_factory/features/purchases_invoices/view_models/purchases_cubit/purchases_cubit.dart';
import 'package:harrasi_rope_factory/features/purchases_invoices/views/screens/purchases_screen.dart';
import 'package:harrasi_rope_factory/features/raw_materials/view_models/raw_material_cubit/raw_materials_cubit.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/screens/raw_materials_screen.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/view_models/sales_invoices_cubit/sales_invoices_cubit.dart';
import 'package:harrasi_rope_factory/features/sales_invoices/views/screens/sales_invoices_screen.dart';
import 'package:harrasi_rope_factory/features/splash/views/screens/splash_screen.dart';
import 'package:harrasi_rope_factory/features/suppliers/view_models/suppliers/suppliers_cubit.dart';
import 'package:harrasi_rope_factory/features/suppliers/views/screens/suppliers_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    RouteNames.splashScreen: (context) => const SplashScreen(),
    RouteNames.onBoardingScreen: (context) => const OnBoardingScreen(),
    RouteNames.signInScreen: (context) => BlocProvider(
          create: (context) => SignInCubit(),
          child: const SignInScreen(),
        ),
    RouteNames.homeScreen: (context) => HomeScreen(),
    RouteNames.signUpScreen: (context) => BlocProvider(
          create: (context) => SignUpCubit(),
          child: const SignUpScreen(),
        ),
    RouteNames.rawMaterialsScreen: (context) => BlocProvider(
          create: (context) => RawMaterialsCubit(),
          child: const RawMaterialsScreen(),
        ),
    RouteNames.categoriesScreen: (context) => BlocProvider(
          create: (context) => CategoriesCubit(),
          child: const CategoriesScreen(),
        ),
    RouteNames.productsScreen: (context) => BlocProvider(
          create: (context) => ProductsCubit(),
          child: const ProductsScreeen(),
        ),
    RouteNames.billOfMaterialsScreen: (context) => BlocProvider(
          create: (context) => BillOfMaterialsCubit(),
          child: const BillOfMaterialsScreen(),
        ),
    RouteNames.billOfMaterialItemsScreen: (context) =>
        const BillOfMaterialItemsScreen(),
    RouteNames.manufactureScreen: (context) => BlocProvider(
          create: (context) => ManufactureItemsCubit(),
          child: const ManufactureScreen(),
        ),
    RouteNames.suppliersScreen: (context) => BlocProvider(
          create: (context) => SuppliersCubit(),
          child: const SuppliersScreen(),
        ),
    RouteNames.customersScreen: (context) => BlocProvider(
          create: (context) => CustomersCubit(),
          child: const CustomersScreen(),
        ),
    RouteNames.purchasesScreen: (context) => BlocProvider(
          create: (context) => PurchasesCubit(),
          child: const PurchasesScreen(),
        ),
    RouteNames.salesScreen: (context) => BlocProvider(
          create: (context) => SalesInvoicesCubit(),
          child: const SalesInvoicesScreen(),
        ),
    RouteNames.expensesCategoryScreen: (context) => BlocProvider(
          create: (context) => ExpensesCategoriesCubit(),
          child: const ExpensesCategoryScreen(),
        ),
    RouteNames.expensesScreen: (context) => BlocProvider(
          create: (context) => ExpensesCubit(),
          child: const ExpensesScreen(),
        ),
  };
}
