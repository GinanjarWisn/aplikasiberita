import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String username;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String avatarImage;

  ProfileScreen({
    required this.username,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.avatarImage,
  });

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(widget.avatarImage),
              radius: 50,
            ),
            SizedBox(height: 16.0),
            Text(
              widget.username,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.fullName,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.phoneNumber,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.email,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
