import 'dart:developer';

import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/error/supabase_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<Map<String, dynamic>>> getDataWithSpacificId({
  required String tableName,
  required String id,
  String? primaryKey,
}) async {
  final supabase = getIt<SupabaseClient>();

  try {
    final response =
        await supabase.from(tableName).select().eq(primaryKey ?? 'id', id);

    if (response.isNotEmpty) {
      return response;
    } else {
      return [];
    }
  } catch (e) {
    log(e.toString());
    throw SupabaseExceptions(errorMessage: '❌ Error while fetching data: $e');
  }
}
