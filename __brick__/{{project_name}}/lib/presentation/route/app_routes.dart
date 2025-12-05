import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/presentation/route/route_names.dart';
import 'package:{{project_name}}/presentation/screens/home_screen.dart';
import 'package:{{project_name}}/presentation/screens/login_screen.dart';
import 'package:{{project_name}}/presentation/screens/settings_screen.dart';
import 'package:{{project_name}}/presentation/screens/splash_screen.dart';
import 'package:{{project_name}}/presentation/widgets/scaffold_with_nav_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: RouteNames.splash,
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: RouteNames.login,
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => ScaffoldWithNavBar(child: child),
      routes: [
        GoRoute(
          name: RouteNames.homeTab,
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: RouteNames.settingsTab,
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);
