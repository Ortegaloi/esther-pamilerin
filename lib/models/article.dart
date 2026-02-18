class Article {

  final String title; 
  final String slug; 
  final String? date;
  final String? category;
  
  final String excerpt; 
  final String content; 
  final List<ArticleSection>? sections;

  Article({
    required this.title, 
    required this.slug, 
    required this.excerpt, 
    required this.content,
    this.sections,
    this.date,
    this.category,
  }); 
}

class ArticleSection{
  final String type;
  final String? text; 
  final String? imagePath;
  final bool? isBold;

  ArticleSection.text(this.text, {this.isBold}) : type = 'text', imagePath = null;
  ArticleSection.image(this.imagePath) : type = 'image', text = null, isBold = null;


}

