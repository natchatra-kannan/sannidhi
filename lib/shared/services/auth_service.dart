import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/constants/supabase_config.dart';

class AuthService {
  AuthService(this._supabase);

  final SupabaseClient _supabase;

  Session? get currentSession => _supabase.auth.currentSession;

  User? get currentUser => _supabase.auth.currentUser;

  bool get isAuthenticated => currentSession != null;

  Future<void> sendMagicLink(String email) async {
  print('Current URL: ${Uri.base}');
  print('Redirect URL: ${SupabaseConfig.authRedirectUrl}');

  await _supabase.auth.signInWithOtp(
    email: email,
    emailRedirectTo: SupabaseConfig.authRedirectUrl,
  );
}

  Future<void> signInWithGoogle() async {
    await _supabase.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: SupabaseConfig.authRedirectUrl,
    );
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
