// ignore_for_file: deprecated_member_use
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/app/cubit/localization_cubit.dart';
import 'package:harrasi_rope_factory/core/app_route/app_routes.dart';
import 'package:harrasi_rope_factory/core/app_route/route_names.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:harrasi_rope_factory/features/dash_board/cubit/theme_cubit.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TranslationCubit()),
      ],
      child: BlocBuilder<TranslationCubit, Locale>(
        builder: (context, state) {
          return LayoutBuilder(
            builder: (context, constraints) {
              SizeConfig.init(context);
              return BlocProvider(
                create: (context) => ThemeCubit(),
                child: BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    if (state is DarkThem) {
                      return MaterialApp(
                        navigatorKey: navigatorKey,
                        debugShowCheckedModeBanner: false,
                        builder: DevicePreview.appBuilder,
                        localizationsDelegates: context.localizationDelegates,
                        supportedLocales: context.supportedLocales,
                        locale: context.locale,
                        theme: ThemeData(
                          scaffoldBackgroundColor: AppColors.kPrimaryColor,
                        ),
                        useInheritedMediaQuery: true,
                        routes: AppRoutes.routes,
                        initialRoute: RouteNames.splashScreen,
                      );
                    } else {
                      return MaterialApp(
                        navigatorKey: navigatorKey,
                        debugShowCheckedModeBanner: false,
                        builder: DevicePreview.appBuilder,
                        localizationsDelegates: context.localizationDelegates,
                        supportedLocales: context.supportedLocales,
                        locale: context.locale,
                        theme: ThemeData.light(),
                        useInheritedMediaQuery: true,
                        routes: AppRoutes.routes,
                        initialRoute: RouteNames.splashScreen,
                      );
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
