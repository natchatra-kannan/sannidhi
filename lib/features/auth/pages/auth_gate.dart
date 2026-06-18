import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/auth_provider.dart';
import '../../../shared/widgets/main_navigation.dart';
import 'login_page.dart';

/// Legacy auth gate kept for compatibility.
///
/// Production routing is handled by [GoRouter] in `app_router.dart`.
/// This widget remains available if a non-router entry point is needed.
class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, _) => Scaffold(
        body: Center(
          child: Text('Auth error: $error'),
        ),
      ),
      data: (state) {
        if (state.session != null) {
          return const MainNavigation();
        }

        return const LoginPage();
      },
    );
  }
}
