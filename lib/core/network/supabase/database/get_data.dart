import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/error/supabase_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<Map<String, dynamic>>> getData({required String tableName}) async {
  final supabase = getIt<SupabaseClient>();

  try {
    final response = await supabase.from(tableName).select().order('created_at');
    if (response.isNotEmpty) {
      return response;
    } else {
      return [];
    }
  } catch (e) {
    throw SupabaseExceptions(errorMessage: '❌ Error while adding data : $e');
  }
}
