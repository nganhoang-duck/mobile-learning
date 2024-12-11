import 'package:flutter/material.dart';
import 'package:city_app/models/city.dart';

import '../pages/city_detail.dart';

class CitySearch extends SearchDelegate<String> {
  final List<City> cities;
  CitySearch(this.cities);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: cities.length,
      itemBuilder: (context, index) {
        final city = cities[index];
        if (city.name!.toLowerCase().contains(query.toLowerCase())) {
          return ListTile(
            title: Text('${city.name}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CityDetailPage(city)),
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? cities
        : cities.where((city) => city.name!.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final city = suggestionList[index];
        return ListTile(
          title: Text('${city.name}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CityDetailPage(city)),
            );
          },
        );
      },
    );
  }
}