import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:city_app/models/country.dart';

class NetworkRequest {
  static List<Country> parseCountry(Uint8List responseBody) {
    var utf8Body = utf8.decode(responseBody);
    var list = json.decode(utf8Body) as List<dynamic>;
    List<Country> countries = list.map((model) => Country.fromJson(model)).toList();
    return countries;
  }

  static Future<List<Country>> fetchCountries({int page = 1}) async {
    final response = await http.get(Uri.parse('http://192.168.109.1:3000/countries'));
    if (response.statusCode == 200) {
      return compute(parseCountry, response.bodyBytes);
    } else if (response.statusCode == 404) {
      throw Exception("Not found");
    } else {
      throw Exception("Can not get data");
    }
  }
}