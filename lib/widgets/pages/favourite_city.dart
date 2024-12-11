import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteCitiesPage extends StatefulWidget {
  @override
  _FavoriteCitiesPageState createState() => _FavoriteCitiesPageState();
}

class _FavoriteCitiesPageState extends State<FavoriteCitiesPage> {
  late List<String> favoriteCities = [];
  late User? loggedInUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    fetchFavoriteCities();
  }

  Future<void> fetchFavoriteCities() async {
    var doc = await FirebaseFirestore.instance.collection('Users').doc(loggedInUser!.uid).get();
    setState(() {
      favoriteCities = List<String>.from(doc['favoriteCities']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Cities'),
      ),
      body: ListView.builder(
        itemCount: favoriteCities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteCities[index]),
          );
        },
      ),
    );
  }
}