import 'package:city_app/models/country.dart';
import 'package:flutter/material.dart';
import 'package:city_app/widgets/components/drawer.dart';

import 'city_detail.dart';

class CountryDetail extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Country country;

  CountryDetail({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "${country.country}",
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
        body: SingleChildScrollView(
          child: Card(
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/${country.flag}',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 20),
                    buildText('Region: ', '${country.region}'),
                    buildText('Capital: ', '${country.capital}'),
                    buildText('Abbreviation: ', '${country.abbreviation}'),
                    buildText('Currency: ', '${country.currency}'),
                    buildText('Area: ', '${country.area} km2'),
                    buildText('Population: ', '${country.population} people'),
                    buildText('Annual population change: ', '${country.annualPopulationChange}%'),
                    buildText('List of ${country.type}:', ''),
                    for (int i = 0; i < country.cities!.length; i++)
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CityDetailPage(country.cities![i])),
                          );
                        },
                        child: Column(
                          children: [
                            buildText(' ', '${country.cities![i].name}'),
                            SizedBox(height: 2)
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
  Widget buildText(String title, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          )
        ],
      )
    );
  }
}


