import 'package:flutter/material.dart';
import 'package:mealmate/screens/onboarding/onboarding_screen.dart';
import 'package:mealmate/screens/welcome/welcome_screen.dart';
import 'package:mealmate/screens/home/home_screen.dart';
import 'package:mealmate/screens/chat/chat_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (_) => const WelcomeScreen(),
  OnboardingScreen.routeName: (_) => const OnboardingScreen(),
  HomeScreen.routeName: (_) => const HomeScreen(),
  ChatScreen.routeName: (_) => const ChatScreen(),
};
