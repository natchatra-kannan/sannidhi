import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/auth/pages/auth_callback_page.dart';
import '../../features/auth/pages/login_page.dart';
import '../../features/auth/pages/splash_page.dart';
import '../../shared/widgets/main_navigation.dart';
import '../constants/app_routes.dart';
import 'auth_refresh_notifier.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

bool _isPublicRoute(String location) {
  return location == AppRoutes.splash ||
      location == AppRoutes.login ||
      location == AppRoutes.authCallback;
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final refreshNotifier = AuthRefreshNotifier(
    Supabase.instance.client.auth.onAuthStateChange,
  );

  ref.onDispose(refreshNotifier.dispose);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
  return null;
},
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.authCallback,
        builder: (context, state) => const AuthCallbackPage(),
      ),
      GoRoute(
        path: AppRoutes.app,
        builder: (context, state) => const MainNavigation(),
      ),
    ],
  );
});