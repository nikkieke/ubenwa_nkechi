import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ubenwa_nkechi/features/features.dart';

final GlobalKey<NavigatorState> _rootNavigation = GlobalKey(debugLabel: "root");

final goRouterProvider = Provider<GoRouter>((ref){
  return GoRouter(
      initialLocation: "/",
      navigatorKey: _rootNavigation,
      debugLogDiagnostics: true,
      restorationScopeId: "app",
      routes: [
        GoRoute(
          path: "/",
          name: AppRoute.onboard.name,
          builder: (context, state) => const OnboardView(),
        ),
      ]
  );
});

enum AppRoute {
  onboard,
}