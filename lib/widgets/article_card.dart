import 'package:flutter/material.dart'; 
import '../models/article.dart'; 

class ArticleCard extends StatelessWidget {

  final Article article; 
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/works/${article.slug}'), 
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16), 
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(article.title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8), 
          Text(article.excerpt), 
        ]),
      ),
    );
   }

}