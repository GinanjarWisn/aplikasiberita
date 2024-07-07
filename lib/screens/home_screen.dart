import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Politics', 'icon': Icons.gavel, 'description': 'News related to government, politics, and policy-making.'},
    {'name': 'Business', 'icon': Icons.business, 'description': 'News related to business, economy, finance, and industry.'},
    {'name': 'Sports', 'icon': Icons.sports, 'description': 'News related to sports, games, and athletic events.'},
    {'name': 'Entertainment', 'icon': Icons.movie, 'description': 'News related to movies, music, theater, and other forms of entertainment.'},
    {'name': 'Health', 'icon': Icons.health_and_safety, 'description': 'News related to health, medicine, and wellness.'},
    {'name': 'Science', 'icon': Icons.science, 'description': 'News related to scientific discoveries, research, and technology.'},
    {'name': 'Technology', 'icon': Icons.devices, 'description': 'News related to technology, gadgets, and innovation.'},
    {'name': 'Environment', 'icon': Icons.eco, 'description': 'News related to environmental issues, conservation, and sustainability.'},
    {'name': 'Education', 'icon': Icons.school, 'description': 'News related to education, schools, and academic research.'},
    {'name': 'Crime', 'icon': Icons.local_police, 'description': 'News related to crime, law enforcement, and justice.'},
    {'name': 'Disaster', 'icon': Icons.warning, 'description': 'News related to natural disasters, accidents, and emergencies.'},
    {'name': 'Travel', 'icon': Icons.travel_explore, 'description': 'News related to travel, tourism, and transportation.'},
    {'name': 'Food', 'icon': Icons.fastfood, 'description': 'News related to food, cuisine, and restaurants.'},
    {'name': 'Lifestyle', 'icon': Icons.style, 'description': 'News related to lifestyle, fashion, and culture.'},
    {'name': 'Social', 'icon': Icons.people, 'description': 'News related to social issues, community, and human interest stories.'},
    {'name': 'Others', 'icon': Icons.category, 'description': 'Other news categories.'},  // Kategori Lainnya
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App', // Ubah tulisan Category menjadi News App
          style: TextStyle(color: Colors.white), // Warna tulisan putih
        ),
        backgroundColor: Colors.black, // Warna latar belakang hitam
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the category detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryDetailScreen(
                    categoryName: categories[index]['name'],
                  ),
                ),
              );
            },
            child: Card(
              elevation: 2,
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    categories[index]['icon'],
                    size: 40,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 10),
                  Text(
                    categories[index]['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

class CategoryDetailScreen extends StatelessWidget {
  final String categoryName;

  CategoryDetailScreen({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: Text('News articles for $categoryName'),
      ),
    );
  }
}
