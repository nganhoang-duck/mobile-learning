import 'package:city_app/widgets/pages/account.dart';
import 'package:city_app/widgets/pages/city_page.dart';
import 'package:city_app/widgets/pages/country_page.dart';
import 'package:city_app/widgets/pages/favourite_city.dart';
import 'package:city_app/widgets/pages/settings.dart';
import 'package:city_app/widgets/pages/world_map.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:city_app/widgets/pages/home_page.dart';
import 'package:city_app/widgets/pages/login_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyCbrv_d6-Kvx9GPFaZKNKtjBOuKTbJBJ-4',
        appId: '1:183067198379:android:6645beb820e7e40eed88ee',
        messagingSenderId: '183067198379',
        projectId: 'city-app-42af4',
        storageBucket: 'city-app-42af4.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => LoginPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/world_map': (context) => WorldMapPage(),
        '/country': (context) => CountryPage(),
        '/city': (context) => CityPage(),
        '/favourite_city': (context) => FavoriteCitiesPage(),
        '/account': (context) => AccountPage(),
        '/settings': (context) => SettingPage(),
      },
    );
  }
}

