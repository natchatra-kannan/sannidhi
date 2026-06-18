import 'package:supabase_flutter/supabase_flutter.dart';

String authErrorMessage(Object error) {
  if (error is AuthException) {
    switch (error.code) {
      case 'over_email_send_rate_limit':
        return 'Too many login emails sent. Please wait a few minutes and try again.';
      case 'validation_failed':
        return 'Please enter a valid email address.';
      case 'otp_expired':
        return 'This login link has expired. Please request a new one.';
      case 'access_denied':
        return 'Sign-in was cancelled or denied.';
      default:
        return error.message;
    }
  }

  return 'Something went wrong. Please try again.';
}

bool isValidEmail(String email) {
  return RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  ).hasMatch(email);
}
