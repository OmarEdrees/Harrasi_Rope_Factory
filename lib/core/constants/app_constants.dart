import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/app_route/route_names.dart';
import 'package:harrasi_rope_factory/features/dash_board/models/dash_board_item_model.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class AppConstants {
  static final List<String> units = const [
    // Weight
    "Gram (g)",
    "Kilogram (kg)",
    "Ton (ton)",

    // Volume
    "Milliliter (ml)",
    "Liter (L)",
    "Gallon (gallon)",
    "Cubic Meter (m³)",

    // Length / Area
    "Centimeter (cm)",
    "Meter (m)",
    "Inch (inch)",
    "Square Meter (m²)",

    // Quantity / Packaging
    "Piece (pc)",
    "Carton (carton)",
    "Box (box)",
    "Bale (bale)",
    "Barrel (barrel)",
    "Bag (bag)"
  ];
  static final List<String> contactPerson = const [
    "WhatsApp",
    "Telegram",
    "Instagram",
    "Facebook",
    "Twitter",
    "Email",
    "Phone",
  ];
  static final List<String> paymentMethods = const [
    'cash',
    'credit',
  ];
  static List<DashBoardItemModel> dashBoardItems = [
    DashBoardItemModel(
      title: LocaleKeys.DashBoardItemModel_Purchases.tr(),
      icon: FontAwesomeIcons.cartArrowDown,
      route: RouteNames.purchasesScreen,
    ),
    DashBoardItemModel(
      title: LocaleKeys.DashBoardItemModel_Sales.tr(),
      icon: FontAwesomeIcons.cashRegister, // أو cartShopping برضو مناسب
      route: RouteNames.salesScreen,
    ),
    DashBoardItemModel(
      title: LocaleKeys.DashBoardItemModel_Suppliers.tr(),
      icon: FontAwesomeIcons.truck, // أفضل تعبير للموردين
      route: RouteNames.suppliersScreen,
    ),
    DashBoardItemModel(
      title: LocaleKeys.DashBoardItemModel_Customers.tr(),
      route: RouteNames.customersScreen,
      icon: FontAwesomeIcons.users,
    ),
    DashBoardItemModel(
      title: LocaleKeys.DashBoardItemModel_Expenses_Categories.tr(),
      icon: FontAwesomeIcons.moneyBills, // أنسب للمصروفات
      route: RouteNames.expensesCategoryScreen,
    ),
    DashBoardItemModel(
      title: LocaleKeys.DashBoardItemModel_Expenses.tr(),
      icon: FontAwesomeIcons.moneyBillWave,
      route: RouteNames.expensesScreen,
    ),
    DashBoardItemModel(
      title: LocaleKeys.DashBoardItemModel_Safe.tr(),
      icon: FontAwesomeIcons.vault, // ممتاز
    ),
    DashBoardItemModel(
      title: LocaleKeys.DashBoardItemModel_Raw_Materials.tr(),
      icon: FontAwesomeIcons.boxesStacked,
      route: RouteNames.rawMaterialsScreen,
    ),
    DashBoardItemModel(
      title: LocaleKeys.DashBoardItemModel_Categories.tr(),
      icon: FontAwesomeIcons.tags,
      route: RouteNames.categoriesScreen,
    ),
    DashBoardItemModel(
      title: LocaleKeys.DashBoardItemModel_Products.tr(),
      icon: FontAwesomeIcons.boxOpen,
      route: RouteNames.productsScreen,
    ),
    DashBoardItemModel(
      title: LocaleKeys.DashBoardItemModel_Bill_of_Materials.tr(),
      icon: FontAwesomeIcons.listCheck,
      route: RouteNames.billOfMaterialsScreen,
    ),
    DashBoardItemModel(
      title: LocaleKeys.DashBoardItemModel_Manufacturing.tr(),
      icon: FontAwesomeIcons.wrench,
      route: RouteNames.manufactureScreen,
    ),
  ];
}
