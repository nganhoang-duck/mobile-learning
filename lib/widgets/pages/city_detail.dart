import 'package:flutter/material.dart';
import 'package:city_app/models/city.dart';

class CityDetailPage extends StatelessWidget {
  final City city;

  CityDetailPage(this.city);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${city.name}'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildText(' In country: ${city.country}'),
            buildText(' Area: ${city.area}'),
            buildText(' Population: ${city.population}'),
          ],
        ),
      ),
    );
  }

  Widget buildText(String text) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}