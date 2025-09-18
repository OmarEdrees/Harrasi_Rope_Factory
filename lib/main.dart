import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:device_preview/device_preview.dart';
import 'package:harrasi_rope_factory/app/my_app.dart';
import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
// import 'package:harrasi_rope_factory/core/notifications/fcm_notification.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/generated/codegen_loader.g.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// Future<void> clearOldCacheIfNeeded() async {
//   final prefs = await SharedPreferences.getInstance();
//   final packageInfo = await PackageInfo.fromPlatform();
//   final currentVersion = packageInfo.buildNumber;

//   final savedVersion = prefs.getString('last_version');

//   if (savedVersion != currentVersion) {
//     // التطبيق تم تحديثه
//     await DefaultCacheManager().emptyCache(); // مسح الكاش
//     await prefs.setString(
//         'last_version', currentVersion); // تحديث النسخة المخزنة
//     debugPrint("✅ Old cache cleared due to app update.");
//   }
// }

//   edreesomar2007@gmail.com

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Supabase.initialize(
    url: "https://ygybnxepuzlkjyzufmpn.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlneWJueGVwdXpsa2p5enVmbXBuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTY2NDUxMzEsImV4cCI6MjA3MjIyMTEzMX0.wsaJh5wmp37aNiYytS0WQtTuM2FubUFGf75bbsz-J08",
  );
  await setupDI();
  // await clearOldCacheIfNeeded();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: DevicePreview(
        enabled: false,
        builder: (context) => MyApp(),
      ),
    ),
  );
  CustomQuickAlert.initialize(navigatorKey);
}
