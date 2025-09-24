import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/app/cubit/localization_cubit.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/dash_board/cubit/theme_cubit.dart';
import 'package:harrasi_rope_factory/features/dash_board/views/widgets/item_of_settings.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/features/settings/views/screens/profile_screen.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width * 0.02,
                  vertical: SizeConfig.height * 0.02,
                ),
                child: CustomPlurTitle(
                    title: LocaleKeys.settings_screen_title.tr(),
                    icon: Icons.settings),
              ),
              ItemOfSettings(
                leading: Icons.brightness_medium,
                title: LocaleKeys.Dark_Light_Mode.tr(),
                trealing: Switch(
                  value: context.watch<ThemeCubit>().state is LightThem,
                  onChanged: (value) {
                    if (value) {
                      context.read<ThemeCubit>().changeThemeToLight();
                    } else {
                      context.read<ThemeCubit>().changeThemeToDark();
                    }
                  },
                  activeColor: AppColors.kSecondaryColor,
                ),
              ),
              ItemOfSettings(
                  leading: Icons.g_translate,
                  title: LocaleKeys.Translation.tr(),
                  trealing: Row(
                    children: [
                      Text(
                        LocaleKeys.current_language.tr(),
                        style: AppTextStyles.title14White,
                      ),
                      SizedBox(width: SizeConfig.width * 0.02),
                      Switch(
                        padding: EdgeInsets.zero,
                        value:
                            context.locale.languageCode == 'en' ? true : false,
                        onChanged: (value) async {
                          await getIt<TranslationCubit>().changeLanguage(
                              context,
                              context.locale.languageCode == 'en'
                                  ? 'ar'
                                  : 'en');
                          //context.pushReplacementScreen(RouteNames.onBoardingScreen);
                        },
                        activeColor: AppColors.kSecondaryColor,
                      ),
                    ],
                  )),
              ItemOfSettings(
                leading: Icons.person,
                title: LocaleKeys.settings_screen_Profile.tr(),
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ));
                },
              ),
              ItemOfSettings(
                  leading: Icons.favorite,
                  title: LocaleKeys.settings_screen_Preferences.tr()),
              ItemOfSettings(
                  leading: Icons.notifications,
                  title: LocaleKeys.settings_screen_Notifications.tr()),
              ItemOfSettings(
                  leading: Icons.security,
                  title: LocaleKeys.settings_screen_Security_Privacy.tr()),
              ItemOfSettings(
                  leading: Icons.account_circle,
                  title: LocaleKeys.settings_screen_Account.tr()),
              ItemOfSettings(
                  leading: Icons.call,
                  title: LocaleKeys.settings_screen_Help_Support.tr()),
              ItemOfSettings(
                  leading: Icons.help,
                  title: LocaleKeys.settings_screen_About.tr()),
            ],
          ),
        ),
      ),
    );
  }
}
