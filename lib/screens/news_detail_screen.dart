import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsDetailScreen extends StatelessWidget {
  final String newsTitle;
  final String newsCategory;
  final String newsSnippet;
  final String newsImage;

  NewsDetailScreen({
    required this.newsTitle,
    required this.newsCategory,
    required this.newsSnippet,
    required this.newsImage,
  });

  void _bookmarkArticle(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> bookmarkedArticles = prefs.getStringList('bookmarkedArticles') ?? [];
    String articleData = '$newsTitle;$newsCategory;$newsSnippet;$newsImage';

    if (!bookmarkedArticles.contains(articleData)) {
      bookmarkedArticles.add(articleData);
      await prefs.setStringList('bookmarkedArticles', bookmarkedArticles);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Article bookmarked')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Article already bookmarked')));
    }
  }

  void _downloadArticle() {
    // Placeholder untuk fungsi download artikel
    // Implementasikan sesuai kebutuhan
  }

  void _shareArticle() {
    // Placeholder untuk fungsi share artikel
    // Implementasikan sesuai kebutuhan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(newsImage, fit: BoxFit.cover),
              SizedBox(height: 16),
              Text(
                newsTitle,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Category: $newsCategory',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 16),
              Text(
                newsSnippet,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: () => _bookmarkArticle(context),
                    icon: Icon(Icons.bookmark),
                    label: Text('Bookmark'),
                  ),
                  ElevatedButton.icon(
                    onPressed: _downloadArticle,
                    icon: Icon(Icons.download),
                    label: Text('Download'),
                  ),
                  ElevatedButton.icon(
                    onPressed: _shareArticle,
                    icon: Icon(Icons.share),
                    label: Text('Share'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
