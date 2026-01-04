// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import '../widgets/app_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const AppHeader(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 820),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pamilerin Esther',
                    style: textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Content Writer',
                    style: textTheme.titleMedium?.copyWith(
                      color: colors.onSurface.withAlpha(200),
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'I write to clarify ideas, shape narratives, and turn '
                    'thought into meaning.',
                    style: textTheme.bodyLarge?.copyWith(
                      height: 1.7,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
