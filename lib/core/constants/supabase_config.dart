import 'package:flutter/foundation.dart';

class SupabaseConfig {
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://hzipobnhfpjgblgwhqvw.supabase.co',
  );

  static const String supabasePublishableKey = String.fromEnvironment(
    'SUPABASE_PUBLISHABLE_KEY',
    defaultValue: 'sb_publishable_Fnm60HEpJoaEnY1DDYVRpg_t-OTCTId',
  );

  /// Redirect URL for magic links and OAuth.
  ///
  /// Override at build time:
  /// `--dart-define=AUTH_REDIRECT_URL=https://your-domain.com/auth/callback`
  ///
  /// Register every value here in Supabase Dashboard → Authentication → URL Configuration.
  static String get authRedirectUrl {
    const override = String.fromEnvironment('AUTH_REDIRECT_URL');
    if (override.isNotEmpty) {
      return override;
    }

    if (kIsWeb) {
      final origin = Uri.base.origin;
      if (origin.startsWith('http')) {
        return '$origin/#/auth/callback';
      }
    }

    return 'http://localhost:3000/auth/callback';
  }
}
