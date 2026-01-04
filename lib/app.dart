// lib/app.dart
import 'package:flutter/material.dart';
import 'routes.dart';
import 'theme.dart';

class WritingApp extends StatelessWidget {
  const WritingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Writing',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: generateRoute,
      initialRoute: '/',
    );
  }
}
