import 'package:city_app/widgets/components/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String username = '';

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userSnapshot =
      await FirebaseFirestore.instance.collection('Users').doc(user.uid).get();
      setState(() {
        username = userSnapshot.get('username');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 50,),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(username),
            onTap: () => Navigator.of(context).popAndPushNamed("/account"),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () => Navigator.of(context).popAndPushNamed("/home"),
          ),
          ListTile(
            leading: Icon(Icons.public),
            title: Text("World map"),
            onTap: () => Navigator.of(context).popAndPushNamed("/world_map"),
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: Text("Countries"),
            onTap: () => Navigator.of(context).popAndPushNamed("/country"),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("Cities"),
            onTap: () => Navigator.of(context).popAndPushNamed("/city"),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favourite cities"),
            onTap: () => Navigator.of(context).popAndPushNamed("/favourite_city"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () => Navigator.of(context).popAndPushNamed("/settings"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Sign out"),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "/login");
              showToast(message: "Successfully signed out");
            },
          ),
        ],
      ),
    );
  }
}