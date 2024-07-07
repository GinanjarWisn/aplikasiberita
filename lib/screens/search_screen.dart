import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _news = [
    {'title': 'Government Policy Changes', 'category': 'Politics'},
    {'title': 'Market Hits Record Highs', 'category': 'Business'},
    {'title': 'Local Team Wins Championship', 'category': 'Sports'},
    {'title': 'New Movie Released', 'category': 'Entertainment'},
    {'title': 'Health Benefits of New Diet', 'category': 'Health'},
    {'title': 'Breakthrough in Quantum Computing', 'category': 'Science'},
    {'title': 'Latest Smartphone Review', 'category': 'Technology'},
    {'title': 'Climate Change Effects', 'category': 'Environment'},
    {'title': 'School Opens New Program', 'category': 'Education'},
    {'title': 'Recent Crime Statistics', 'category': 'Crime'},
    {'title': 'Natural Disaster Relief Efforts', 'category': 'Disaster'},
    {'title': 'Top Travel Destinations', 'category': 'Travel'},
    {'title': 'Famous Chef Opens New Restaurant', 'category': 'Food'},
    {'title': 'Latest Fashion Trends', 'category': 'Lifestyle'},
    {'title': 'Community Volunteer Programs', 'category': 'Social'},
    {'title': 'Miscellaneous News', 'category': 'Others'},
  ];
  List<Map<String, String>> _filteredNews = [];

  @override
  void initState() {
    super.initState();
    _filteredNews = _news;
  }

  void _filterNews(String query) {
    final filtered = _news.where((news) {
      final titleLower = news['title']!.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      _filteredNews = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'News App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                _filterNews(value);
              },
              decoration: InputDecoration(
                labelText: 'Search news',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredNews.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredNews[index]['title']!),
                  subtitle: Text(_filteredNews[index]['category']!),
                  onTap: () {
                    // Navigate to the news detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailScreen(
                          newsTitle: _filteredNews[index]['title']!,
                          newsCategory: _filteredNews[index]['category']!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NewsDetailScreen extends StatelessWidget {
  final String newsTitle;
  final String newsCategory;

  NewsDetailScreen({required this.newsTitle, required this.newsCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
