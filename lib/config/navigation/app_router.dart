import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ve_news/presentation/home/home_screen.dart';
import 'package:ve_news/presentation/intro/intro_screen.dart';
import 'package:ve_news/presentation/summary/new_summary_screen.dart';

final class AppRouter {
  RouterConfig<Object>? get config => _router;

  static const String intro = '/';
  static const String home = '/home';
  static const String newSummary = '/new';

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: intro,
        builder: (context, state) => IntroScreen(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: newSummary,
        builder: (context, state) => const NewSummaryScreen(),
      ),
    ],
  );
}
