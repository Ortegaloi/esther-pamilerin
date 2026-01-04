// lib/pages/works_page.dart
import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/article_card.dart';
import '../data/article.dart';

class WorksPage extends StatelessWidget {
  const WorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
     final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const AppHeader(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 820),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected Works',
                    style: textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                   Container(
                    width: 60,
                    height: 2,
                    color: colors.onSurface.withAlpha(90),
                  ),
                  const SizedBox(height: 40),

                  ...articles.map(
                    (article) => Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: ArticleCard(article: article),
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
