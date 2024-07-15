import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:package_info_plus/package_info_plus.dart";
import "package:screen_post/features/home/home_screen.dart";
import "package:screen_post/features/instagram/instagram_screen.dart";
import "package:screen_post/features/my_post/my_post_screen.dart";
import "package:screen_post/features/splash/splash_screen.dart";
import "package:screen_post/features/telegram/telegram_screen.dart";
import "package:screen_post/features/twitter/twitter_screen.dart";

part "name_routes.dart";

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: Routes.initial,
  navigatorKey: rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.initial,
      name: Routes.initial,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const SplashScreen(),
    ),
    GoRoute(
        path: Routes.home,
        name: Routes.home,
        parentNavigatorKey: rootNavigatorKey,
        builder: (_, __) => const HomeScreen()),
    GoRoute(
        path: Routes.myPost,
        name: Routes.myPost,
        parentNavigatorKey: rootNavigatorKey,
        builder: (_, __) => const MyPostScreen()),
    GoRoute(
        path: Routes.telegram,
        name: Routes.telegram,
        parentNavigatorKey: rootNavigatorKey,
        builder: (_, __) => const TelegramScreen()),
    GoRoute(
        path: Routes.instagram,
        name: Routes.instagram,
        parentNavigatorKey: rootNavigatorKey,
        builder: (_, __) => const InstagramScreen()),
    GoRoute(
        path: Routes.twitter,
        name: Routes.twitter,
        parentNavigatorKey: rootNavigatorKey,
        builder: (_, __) => const TwitterScreen()),
  ],
);
