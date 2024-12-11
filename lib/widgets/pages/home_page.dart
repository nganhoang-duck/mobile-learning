import 'package:city_app/widgets/pages/city_page.dart';
import 'package:city_app/widgets/pages/country_page.dart';
import 'package:city_app/widgets/pages/favourite_city.dart';
import 'package:city_app/widgets/pages/world_map.dart';
import 'package:flutter/material.dart';
import '../components/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Home",
          style: TextStyle(
              fontSize: 20,
              color: Colors.white
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () =>  _scaffoldKey.currentState!.openDrawer(),
        ),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Cities in the world',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: buildCard(
                  'assets/images/continent.png',
                  'World map',
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorldMapPage(),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: buildCard(
                  'assets/images/country.png',
                  'Country',
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountryPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: buildCard(
                  'assets/images/city.png',
                  'City',
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CityPage(),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: buildCard(
                  'assets/images/favourite_place.png',
                  'Favourite place',
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoriteCitiesPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget buildCard(String imagePath, String text, VoidCallback onPressed) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onPressed, // Xử lý sự kiện nhấn vào ảnh
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 15),
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}