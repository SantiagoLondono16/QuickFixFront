import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_fix/screens/History_screen.dart';
import 'package:quick_fix/screens/provider_home_screen.dart';
import 'package:quick_fix/screens/provider_settings_screen.dart';
import 'package:quick_fix/screens/request_service.dart';
import 'package:quick_fix/screens/settins_screen.dart';
import 'package:quick_fix/screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/provider_requests_screen.dart';
import 'screens/provider_services_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/request-service',
      builder: (context, state) => const RequestServiceScreen(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const ChatScreen(),
    ),
    GoRoute(
      path: '/provider-home',
      builder: (context, state) => const ProviderHomeScreen(),
    ),
    GoRoute(
      path: '/settings-profile',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      path: '/provider-settings',
      builder: (context, state) => const ProviderSettingsScreen(),
    ),
    GoRoute(
      path: '/provider-services',
      builder: (context, state) => const ProviderServicesScreen(),
    ),
    GoRoute(
      path: '/provider-requests',
      builder: (context, state) => const ProviderRequestsScreen(),
    ),
  ],
);
