import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aplikasiberita/screens/news_detail_screen.dart';

class BookmarkScreen extends StatefulWidget {
  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  List<Map<String, String>> _bookmarkedArticles = [];

  @override
  void initState() {
    super.initState();
    _loadBookmarkedArticles();
  }

  void _loadBookmarkedArticles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedArticles = prefs.getStringList('bookmarkedArticles');
    if (savedArticles != null) {
      setState(() {
        _bookmarkedArticles = savedArticles.map((article) {
          List<String> articleData = article.split(';');
          return {
            'title': articleData[0],
            'category': articleData[1],
            'snippet': articleData[2],
            'image': articleData[3],
          };
        }).toList();
      });
    }
  }

  void _saveBookmarkedArticles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedArticles = _bookmarkedArticles.map((article) {
      return '${article['title']};${article['category']};${article['snippet']};${article['image']}';
    }).toList();
    await prefs.setStringList('bookmarkedArticles', savedArticles);
  }

  void _deleteBookmark(int index) {
    setState(() {
      _bookmarkedArticles.removeAt(index);
      _saveBookmarkedArticles();
    });
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this bookmark?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                _deleteBookmark(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _bookmarkedArticles.isEmpty
            ? Center(child: Text('No bookmarks yet'))
            : ListView.builder(
                itemCount: _bookmarkedArticles.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.bookmark),
                      title: Text(_bookmarkedArticles[index]['title']!),
                      subtitle: Text(_bookmarkedArticles[index]['category']!),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailScreen(
                              newsTitle: _bookmarkedArticles[index]['title']!,
                              newsCategory: _bookmarkedArticles[index]['category']!,
                              newsSnippet: _bookmarkedArticles[index]['snippet']!,
                              newsImage: _bookmarkedArticles[index]['image']!,
                            ),
                          ),
                        );
                      },
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _confirmDelete(index);
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
