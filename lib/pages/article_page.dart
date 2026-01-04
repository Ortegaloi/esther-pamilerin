// lib/pages/article_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/app_header.dart';
import '../data/article.dart';

class ArticlePage extends StatelessWidget {
  final String slug;
  const ArticlePage({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    final article = articles.firstWhere((a) => a.slug == slug);
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const AppHeader(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    article.title,
                    style: textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Copy link button
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        final url = Uri.base.toString();
                        Clipboard.setData(ClipboardData(text: url));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Link copied')),
                        );
                      },
                      child: Text(
                        'Copy link',
                        style: textTheme.bodySmall,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Theme-aware divider
                  Container(
                    width: 80,
                    height: 2,
                    color: colors.onSurface.withAlpha(90), // subtle divider
                  ),

                  const SizedBox(height: 32),

                  // Article body
                  Text(
                    article.content,
                    style: textTheme.bodyLarge?.copyWith(
                      height: 1.8,
                      fontSize: 16,
                      color: colors.onSurface,
                    ),
                  ),

                  const SizedBox(height: 64),

                  // Footer note
                  Container(
                    padding: const EdgeInsets.only(top: 24),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: colors.onSurface.withAlpha(90),
                        ),
                      ),
                    ),
                    child: Text(
                      '— End',
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.onSurface,
                      ),
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
