import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseComp {
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: 'https://qzzhxmgzccxxnqqsbscp.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF6emh4bWd6Y2N4eG5xcXNic2NwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDkzNjMxOTgsImV4cCI6MjAyNDkzOTE5OH0.iFj-giCq0ILBVToWV18V77aypH7s9nNTDfnkjEM9Src',
    );
  }

  static final supabase = Supabase.instance.client;
}
