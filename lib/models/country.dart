import 'package:city_app/models/city.dart';

class Country {
  String? country;
  String? abbreviation;
  int? area;
  int? population;
  String? capital;
  String? currency;
  String? flag;
  String? region;
  double? annualPopulationChange;
  String? type;
  List<City>? cities;
  String? id;

  Country({
    this.country,
    this.abbreviation,
    this.area,
    this.population,
    this.capital,
    this.currency,
    this.flag,
    this.region,
    this.annualPopulationChange,
    this.type,
    this.cities,
    this.id,
  });

  Country.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    abbreviation = json['abbreviation'];
    area = json['area'];
    population = json['population'];
    capital = json['capital'];
    currency = json['currency'];
    flag = json['flag'];
    region = json['region'];
    annualPopulationChange = json['annual_population_change'];
    type = json['type'];
    if (json['cities'] != null) {
      cities = <City>[];
      json['cities'].forEach((v) {
        cities!.add(City.fromJson(v));
      });
    }
    id = json['id'];
  }
}