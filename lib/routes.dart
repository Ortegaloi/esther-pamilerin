import 'package:flutter/material.dart';
import 'pages/home_page.dart'; 
import 'pages/works_page.dart';
import 'pages/article_page.dart';
import 'pages/about_page.dart'; 
import 'pages/dedication_page.dart';
import 'pages/setting_page.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  final uri = Uri.parse(settings.name ?? '/');

  if(uri.pathSegments.isEmpty){
    return MaterialPageRoute(builder: (_) => const HomePage());
  }

  switch(uri.pathSegments.first){
    case 'works': 
    if(uri.pathSegments.length == 2){
      return MaterialPageRoute(
      builder: (_) => ArticlePage(slug: uri.pathSegments[1]),   
      );
    }
    return MaterialPageRoute(builder: (_) => const WorksPage()); 

    case 'about': 
    return MaterialPageRoute(builder: (_) => const AboutPage()); 

    case 'for-you': 
    return MaterialPageRoute(builder: (_) => const DedicationPage());
    case 'setting':
    return MaterialPageRoute(builder: (_) => const SettingsPage());
    default: 
    return MaterialPageRoute(builder: (_) => const HomePage());
  }
}