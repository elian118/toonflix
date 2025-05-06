import 'package:flutter/material.dart';

import '../screens/pomodoro_home_screen.dart';

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          surface: const Color(0xFFE7626C),
          seedColor: const Color(0xFFE7626C),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: const PomodoroHomeScreen(),
    );
  }
}
