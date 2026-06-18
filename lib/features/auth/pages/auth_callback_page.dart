import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/constants/app_routes.dart';
import '../../../shared/providers/auth_provider.dart';

/// Handles magic-link and OAuth redirects landing on `/auth/callback`.
///
/// Supabase Flutter exchanges the URL code for a session automatically (PKCE).
/// This page waits for that session, then routes into the app.
class AuthCallbackPage extends ConsumerStatefulWidget {
  const AuthCallbackPage({super.key});

  @override
  ConsumerState<AuthCallbackPage> createState() => _AuthCallbackPageState();
}

class _AuthCallbackPageState extends ConsumerState<AuthCallbackPage> {
  String? _errorMessage;

  Future<void> _resolveSession() async {
    // Give the Supabase SDK more time to exchange the URL code for a session.
    // Some environments (slow networks, dev servers) need more than the
    // original ~5s window. Wait up to ~12s before showing an error.
    for (var attempt = 0; attempt < 40; attempt++) {
      await Future.delayed(const Duration(milliseconds: 300));

      if (!mounted) return;

      final session = Supabase.instance.client.auth.currentSession;
      if (session != null) {
        if (mounted) {
          context.go(AppRoutes.app);
        }
        return;
      }
    }

    if (!mounted) return;

    setState(() {
      _errorMessage = 'Could not complete sign-in. Please try again.';
    });
  }

  @override
  void initState() {
    super.initState();

    ref.listen(authStateProvider, (previous, next) {
      next.whenData((state) {
        if (state.session != null && mounted) {
          context.go(AppRoutes.app);
        }
      });
    });

    _resolveSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: _errorMessage == null
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Signing you in...'),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 48,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _errorMessage!,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: () => context.go(AppRoutes.login),
                      child: const Text('Back to Login'),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}