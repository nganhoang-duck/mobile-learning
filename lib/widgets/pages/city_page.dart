import 'package:city_app/models/city.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:city_app/models/country.dart';
import 'package:city_app/network/network_request.dart';
import 'package:city_app/widgets/components/city_search.dart';
import 'package:city_app/widgets/components/drawer.dart';
import 'package:city_app/widgets/components/favourite_city_handle.dart';

import 'city_detail.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Country> countries = [];
  List<City> allCities = [];
  List<City> searchResults = [];
  List<City> favoriteCities = [];
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User? loggedInUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchCountries().then((dataFromServer) {
      setState(() {
        countries = dataFromServer;
        for (var country in countries) {
          if (country.cities != null) {
            for (var city in country.cities!) {
              allCities.add(city);
            }
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "All cities in the world",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CitySearch(allCities),
              );
            },
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8, // Set a fixed height or use a percentage
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: allCities.length,
                itemBuilder: (context, index) {
                  final city = allCities[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityDetailPage(city),
                      ));
                    },
                    title: Text('${city.name}'),
                    trailing: IconButton(
                      icon: city.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                      onPressed: () {
                        FavoriteCityHandler.toggleFavoriteCity(allCities[index], allCities, favoriteCities, _firestore, loggedInUser);
                        if (city.isFavorite) {
                          _firestore.collection('Users').doc(loggedInUser!.uid).update({
                            'favoriteCities': FieldValue.arrayUnion([city.name]),
                          });
                        } else {
                          _firestore.collection('Users').doc(loggedInUser!.uid).update({
                            'favoriteCities': FieldValue.arrayRemove([city.name]),
                          });
                        }
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}