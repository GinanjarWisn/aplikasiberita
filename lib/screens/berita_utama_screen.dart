import 'package:flutter/material.dart';
import 'package:aplikasiberita/screens/news_detail_screen.dart';

class BeritaUtamaScreen extends StatelessWidget {
  final List<Map<String, String>> newsList = [
    {
      'title': 'Breaking News: Market Hits Record Highs',
      'category': 'Business',
      'snippet': 'The stock market reached new highs today as investors reacted positively to the latest economic data.',
      'image': 'assets/images/market.jpg'
    },
    {
      'title': 'Government Announces New Policies',
      'category': 'Politics',
      'snippet': 'The government has announced a series of new policies aimed at improving the economy and reducing unemployment.',
      'image': 'assets/images/government.jpg'
    },
    {
      'title': 'Sports Championship: Local Team Wins',
      'category': 'Sports',
      'snippet': 'The local team emerged victorious in the championship game, securing their place in the finals.',
      'image': 'assets/images/sports.jpg'
    },
    // Tambahkan berita lainnya dengan struktur yang sama
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetailScreen(
                      newsTitle: newsList[index]['title']!,
                      newsCategory: newsList[index]['category']!,
                      newsSnippet: newsList[index]['snippet']!,
                      newsImage: newsList[index]['image']!,
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(newsList[index]['image']!, fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsList[index]['title']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          newsList[index]['snippet']!,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 4),
                        Text(
                          newsList[index]['category']!,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
