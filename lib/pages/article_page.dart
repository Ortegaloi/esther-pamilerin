// lib/pages/article_page.dart
import 'package:auto_size_text/auto_size_text.dart';
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
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    
    // Clamp text scaling for accessibility
    final textScale = mediaQuery.textScaleFactor.clamp(1.0, 1.3);
    
    // Responsive padding
    double horizontalPadding = screenWidth < 600 ? 16 : 10;
    double verticalPadding = screenWidth < 600 ? 32 : 30;
    
    // Responsive content width
    double contentMaxWidth = screenWidth < 600 ? double.infinity : 
                            screenWidth < 900 ? 600 : 720;

    return Scaffold(
      appBar: const AppHeader(),
      body: MediaQuery(
        // Apply normalized text scaling to entire page
        data: mediaQuery.copyWith(textScaleFactor: textScale),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, 
              vertical: verticalPadding
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: contentMaxWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title with auto-sizing
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return AutoSizeText(
                          article.title,
                          style: textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                          ),
                          maxLines: 3,
                          minFontSize: screenWidth < 600 ? 24 : 28,
                          maxFontSize: screenWidth < 600 ? 28 : 32,
                          overflow: TextOverflow.ellipsis,
                        );
                      },
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
                          style: textTheme.bodySmall?.copyWith(
                            fontSize: screenWidth < 600 ? 12 : 14,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Theme-aware divider
                    Container(
                      width: screenWidth < 600 ? 60 : 80,
                      height: 2,
                      color: colors.onSurface.withAlpha(90),
                    ),

                    const SizedBox(height: 32),

                    // Article body with normalized text
                    if (article.sections != null)
                      ...article.sections!.map((section) {
                        if (section.type == 'text') {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: screenWidth < 600 ? 12 : 16
                            ),
                            child: NormalizedArticleText(
                              section.text!,
                              isBold: section.isBold ?? false,
                            ),
                          );
                        } else if (section.type == 'image') {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: screenWidth < 600 ? 16 : 24
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                section.imagePath!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: screenWidth < 600 ? 150 : 200,
                                    color: colors.surfaceVariant,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.broken_image, 
                                               color: colors.onSurfaceVariant),
                                          const SizedBox(height: 8),
                                          Text('Image not found',
                                               style: textTheme.bodySmall),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      }).toList()
                    else
                      // Fallback to regular content with normalization
                      NormalizedArticleText(article.content),

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
                          fontSize: screenWidth < 600 ? 12 : 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final double? mobileFontSize;
  final double? tabletFontSize;
  final double? desktopFontSize;
  
  const ResponsiveText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.mobileFontSize,
    this.tabletFontSize,
    this.desktopFontSize,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final width = MediaQuery.of(context).size.width;
    
    // Determine base font size based on screen width
    double baseFontSize = 16; // Default
    
    if (width < 600) { // Mobile
      baseFontSize = mobileFontSize ?? 14;
    } else if (width < 1200) { // Tablet
      baseFontSize = tabletFontSize ?? 16;
    } else { // Desktop
      baseFontSize = desktopFontSize ?? 18;
    }
    
    // Apply the style with responsive size
    final responsiveStyle = (style ?? const TextStyle()).copyWith(
      fontSize: baseFontSize,
    );
    
    return Text(
      text,
      style: responsiveStyle,
      textAlign: textAlign,
    );
  }
}




class NormalizedArticleText extends StatelessWidget {
  final String text;
  final bool isBold;
  final TextAlign align;
  
  const NormalizedArticleText(
    this.text, {
    super.key,
    this.isBold = false,
    this.align = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // ignore: deprecated_member_use
    final textScale = MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.3);
    final theme = Theme.of(context);
    
    // Calculate responsive font size
    double fontSize;
    double lineHeight;
    double letterSpacing;
    
    if (width < 400) { // Small phone
      fontSize = 14;
      lineHeight = 1.6;
      letterSpacing = 0.2;
    } else if (width < 600) { // Regular phone
      fontSize = 15;
      lineHeight = 1.7;
      letterSpacing = 0.15;
    } else if (width < 900) { // Tablet
      fontSize = 16;
      lineHeight = 1.8;
      letterSpacing = 0.1;
    } else { // Desktop
      fontSize = 17;
      lineHeight = 1.9;
      letterSpacing = 0.05;
    }
    
    // Apply text scale factor
    fontSize *= textScale;
    
    return Text(
      text,
      textAlign: align,
      style: theme.textTheme.bodyLarge?.copyWith(
        fontSize: fontSize,
        height: lineHeight,
        letterSpacing: letterSpacing,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: theme.colorScheme.onSurface,
      ),
    );
  }
}


class AutoSizeArticleTitle extends StatelessWidget {
  final String text;
  final double maxFontSize;
  final double minFontSize;
  
  const AutoSizeArticleTitle(
    this.text, {
    super.key,
    this.maxFontSize = 32,
    this.minFontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return LayoutBuilder(
      builder: (context, constraints) {
        return AutoSizeText(
          text,
          style: theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w600,
            height: 1.2,
          ),
          maxLines: 3,
          minFontSize: minFontSize,
          maxFontSize: maxFontSize,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
        );
      },
    );
  }
}


