import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jumunseo/features/community/community_screen.dart';
import 'package:jumunseo/features/dilemma/dilemma_screen.dart';
import 'package:jumunseo/features/home/home_screen.dart';
import 'package:jumunseo/features/wizard/wizard_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
        path: '/dilemma/:catagory/:id',
        builder: (context, state) {
          return DilemmaScreen();
        }),
    GoRoute(
        path: '/wizard',
        builder: (context, state) {
          return const WizardScreen();
        }),
    GoRoute(
        path: '/community',
        builder: (context, state) {
          return const CommunityScreen();
        }),
  ],
);