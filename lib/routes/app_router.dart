import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled_flutter_pr/routes/app_routes.dart';
import 'package:untitled_flutter_pr/shared/shared.dart';
import 'package:untitled_flutter_pr/styles/styles.dart';

import '../screens/screens.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, GoRouterState state, child) {
          return NoTransitionPage(
            child: ScaffoldWithNavBar(
              route: state.location,
              child: child,
            ),
          );
        },
        routes: [
          GoRoute(
            path: AppRoutes.root,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) => NoTransitionPage(
              child: Scaffold(
                body: Center(
                  child: Text(state.path ?? "aa", style: TextStyle(color: AppColors.green6)),
                ),
              ),
            ),
          ),
          GoRoute(
            path: AppRoutes.graph,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) => NoTransitionPage(
              child: Scaffold(
                body: Center(
                  child: Text(state.location),
                ),
              ),
            ),
          )
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.login,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Login()
        ),
      )
    ],
  );
}
