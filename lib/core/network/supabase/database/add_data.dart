import 'dart:developer';

import 'package:harrasi_rope_factory/core/di/dependancy_injection.dart';
import 'package:harrasi_rope_factory/core/error/supabase_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> addData(
    {required String tableName, required Map<String, dynamic> data}) async {
  final supabase = getIt<SupabaseClient>();

  try {
    final response = await supabase.from(tableName).upsert(data).select();

    if (response.isNotEmpty) {
      log('✅ User added successfully!');
    } else {
      throw SupabaseExceptions(errorMessage: '❌ Failed to add data');
    }
  } catch (e) {
    throw SupabaseExceptions(errorMessage: '❌ Error while adding data : $e');
  }
}
