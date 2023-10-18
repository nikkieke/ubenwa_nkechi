import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ubenwa_nkechi/features/features.dart';

final GlobalKey<NavigatorState> _rootNavigation = GlobalKey(debugLabel: 'root');

final goRouterProvider = Provider<GoRouter>((ref){
  return GoRouter(
      initialLocation: '/',
      //initialLocation: '/animatedLoader',
      navigatorKey: _rootNavigation,
      debugLogDiagnostics: true,
      restorationScopeId: 'app',
      routes: [
        GoRoute(
          path: '/',
          name: AppRoute.onboard.name,
          builder: (context, state) => const OnboardView(),
        ),
        GoRoute(
          path: '/animatedLoader',
          name: AppRoute.animatedLoader.name,
          builder: (context, state) => const AnimatedLoaderView(),
        ),
        GoRoute(
          path: '/records',
          name: AppRoute.records.name,
          builder: (context, state) => const RecordsView(),
        ),
      ],
  );
});

enum AppRoute {
  onboard,
  records,
  animatedLoader,
}
