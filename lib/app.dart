// lib/app.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes.dart';
import 'theme.dart';
import 'provider/theme_provider.dart'; // We'll create this next

class WritingApp extends StatelessWidget {
  const WritingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        // Add other providers here if needed
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Personal Writing',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeProvider.themeMode,
            onGenerateRoute: generateRoute,
            initialRoute: '/',
          );
        },
      ),
    );
  }
}