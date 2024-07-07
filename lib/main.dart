import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aplikasiberita/screens/login_screen.dart';
import 'package:aplikasiberita/screens/berita_utama_screen.dart';
import 'package:aplikasiberita/screens/bookmark_screen.dart';
import 'package:aplikasiberita/screens/home_screen.dart';
import 'package:aplikasiberita/screens/profile_screen.dart';
import 'package:aplikasiberita/screens/search_screen.dart';

void main() {
  runApp(AplikasiBerita());
}

class AplikasiBerita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Berita',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Set LoginScreen as the initial page
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  late String _username;
  late String _fullName;
  late String _email;
  late String _phoneNumber;
  late String _avatarImage;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? 'john_doe';
      _fullName = prefs.getString('fullName') ?? 'John Doe';
      _email = prefs.getString('email') ?? 'john.doe@example.com';
      _phoneNumber = prefs.getString('phoneNumber') ?? '+1234567890';
      _avatarImage = prefs.getString('avatarImage') ?? '<a href="https://imgbb.com/"><img src="https://i.ibb.co.com/QQ04vhJ/adventurer-1720336248722.jpg" alt="adventurer-1720336248722" border="0"></a>';
      _widgetOptions = <Widget>[
        HomeScreen(),
        SearchScreen(),
        BeritaUtamaScreen(),
        BookmarkScreen(),
        ProfileScreen(
          username: _username,
          fullName: _fullName,
          email: _email,
          phoneNumber: _phoneNumber,
          avatarImage: _avatarImage,
        ),
      ];
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article, color: Colors.black),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, color: Colors.black),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
