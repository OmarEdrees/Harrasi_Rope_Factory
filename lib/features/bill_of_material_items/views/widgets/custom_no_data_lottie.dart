import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/assets/lotties/app_lotties.dart';
import 'package:lottie/lottie.dart';

class CustomNoDataLottie extends StatelessWidget {
  const CustomNoDataLottie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(AppLotties.noDataLottie));
  }
}
