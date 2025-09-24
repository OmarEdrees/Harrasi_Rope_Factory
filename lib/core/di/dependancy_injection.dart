import 'package:harrasi_rope_factory/app/cubit/localization_cubit.dart';
import 'package:harrasi_rope_factory/core/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:harrasi_rope_factory/core/network/supabase/auth/sign_in_with_google.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  final cacheHelper = CacheHelper();
  await cacheHelper.init();
  getIt.registerSingleton<CacheHelper>(cacheHelper);
  getIt.registerLazySingleton(() => Supabase.instance.client);
  // getIt.registerLazySingleton(() => TranslationService());
  getIt.registerLazySingleton(() => TranslationCubit());
  getIt.registerLazySingleton(() => GoogleAuthService());
}
