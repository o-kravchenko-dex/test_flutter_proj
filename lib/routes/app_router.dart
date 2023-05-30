import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled_flutter_pr/routes/app_routes.dart';
import 'package:untitled_flutter_pr/shared/shared.dart';
import 'package:untitled_flutter_pr/styles/styles.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.root,
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
                  child: Text(state.location, style: TextStyle(color: AppColors.green6)),
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
    ],
  );
}
