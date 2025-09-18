import 'package:easy_localization/easy_localization.dart';
import 'package:harrasi_rope_factory/core/utilies/assets/lotties/app_lotties.dart';
import 'package:harrasi_rope_factory/features/on_boarding/views/widgets/custom_on_boarding_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class OnBoardingCubit extends Cubit<int> {
  OnBoardingCubit() : super(0) {
    percentage = calculatePercentage(0);
  }

  final PageController pageController = PageController(initialPage: 0);
  double percentage = 0.2;

  List<Widget> steps = [
    CustomOnBoardingStep(
      image: AppLotties.welcomeLottie,
      title: LocaleKeys.onboarding_welcome_title.tr(),
      description: LocaleKeys.onboarding_welcome_description.tr(),
    ),
    CustomOnBoardingStep(
      image: AppLotties.salesLottie,
      title: LocaleKeys.onboarding_sales_title.tr(),
      description: LocaleKeys.onboarding_sales_description.tr(),
    ),
    CustomOnBoardingStep(
      image: AppLotties.manufacturingLottie,
      title: LocaleKeys.onboarding_manufacturing_title.tr(),
      description: LocaleKeys.onboarding_manufacturing_description.tr(),
    ),
    CustomOnBoardingStep(
      image: AppLotties.accountingLottie,
      title: LocaleKeys.onboarding_accounting_title.tr(),
      description: LocaleKeys.onboarding_accounting_description.tr(),
    ),
    CustomOnBoardingStep(
      image: AppLotties.receiptLottie,
      title: LocaleKeys.onboarding_invoices_title.tr(),
      description:
          "Communicate directly with buyers and sellers through secure in-app chat",
    ),
    CustomOnBoardingStep(
      image: AppLotties.inventoryLottie,
      title: LocaleKeys.onboarding_inventory_title.tr(),
      description: LocaleKeys.onboarding_inventory_description.tr(),
    ),
  ];

  double calculatePercentage(int index) {
    return (index + 1) / steps.length;
  }

  void nextPage() {
    if (state < steps.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInCirc,
      );
      final newIndex = state + 1;
      percentage = calculatePercentage(newIndex);
      emit(newIndex);
    } else {
      emit(steps.length);
    }
  }

  void previousPage() {
    if (state > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      final newIndex = state - 1;
      percentage = calculatePercentage(newIndex);
      emit(newIndex);
    }
  }

  void changePage(int index) {
    pageController.jumpToPage(index);
    percentage = calculatePercentage(index);
    emit(index);
  }
}
