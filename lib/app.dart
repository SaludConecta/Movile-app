import 'package:flutter/material.dart';

import 'core/theme/app_palette.dart';
import 'features/auth/presentation/login_screen.dart';

class ConectaApp extends StatelessWidget {
  const ConectaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaludConecta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppPalette.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppPalette.ink,
          surface: AppPalette.background,
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: AppPalette.ink,
            fontSize: 23,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.4,
          ),
          titleMedium: TextStyle(
            color: AppPalette.ink,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(color: AppPalette.muted, height: 1.4),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
