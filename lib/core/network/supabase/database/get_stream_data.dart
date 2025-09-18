import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/error/supabase_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Stream<List<Map<String, dynamic>>> streamData({required String tableName}) async* {
  final supabase = getIt<SupabaseClient>();
  try {
    yield* supabase
        .from(tableName)
        .stream(primaryKey: ['id'])
        .handleError((error) {
          throw SupabaseExceptions(errorMessage: 'Error while streaming data: $error');
        })
        .map((data) {
          if (data.isEmpty) {
            return [];
          }
          return data;
        });
  } catch (e) {
    throw SupabaseExceptions(errorMessage: 'Exception caught in streamData: $e');
  }
}
