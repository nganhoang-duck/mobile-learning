import 'package:city_app/widgets/pages/country_detail.dart';
import 'package:flutter/material.dart';
import 'package:city_app/models/country.dart';

class CountrySearch extends SearchDelegate<String> {
  final List<Country> countries;
  CountrySearch(this.countries);

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
      itemCount: countries.length,
      itemBuilder: (context, index) {
        final country = countries[index];
        if (country.country!.toLowerCase().contains(query.toLowerCase())) {
          return ListTile(
            title: Text('${country.country}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountryDetail(country: country),
                ),
              );
            },
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countries
        : countries.where((country) => country.country!.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final country = suggestionList[index];
        return ListTile(
          title: Text('${country.country}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CountryDetail(country: country),
              ),
            );
          },
        );
      },
    );
  }
}