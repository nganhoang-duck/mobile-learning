import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:city_app/models/city.dart';

class FavoriteCityHandler {
  static void toggleFavoriteCity(
      City city, List<City> allCities, List<City> favoriteCities, FirebaseFirestore firestore, User? loggedInUser) async {
    city.isFavorite = !city.isFavorite;

    if (city.isFavorite) {
      favoriteCities.add(city);
    } else {
      favoriteCities.remove(city);
    }

    try {
      await firestore.collection('Users').doc(loggedInUser!.uid).update({
        'favoriteCities': favoriteCities.map((city) => city.name).toList(),
      });
    } catch (e) {
      print('Error updating favoriteCities: $e');
    }
  }
}