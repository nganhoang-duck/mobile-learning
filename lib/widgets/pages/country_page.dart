import 'package:city_app/widgets/pages/country_detail.dart';
import 'package:flutter/material.dart';
import '../../models/country.dart';
import '../components/drawer.dart';
import 'package:city_app/network/network_request.dart';
import 'package:city_app/widgets/components/country_search.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Country> countries = [];
  List<Country> searchResults = [];

  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchCountries().then((dataFromServer) {
      setState(() {
        countries = dataFromServer;
        searchResults = List.from(countries);
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
          "List of countries",
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
                delegate: CountrySearch(countries),
              );
            },
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: Center(
        child: countries.isEmpty
          ? CircularProgressIndicator()
          : ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, index) {
            final country = countries[index];
            return CountryCard(
              'assets/images/${country.flag}',
              '${country.country}',
              '${country.capital}',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CountryDetail(country: country),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget CountryCard(String flag, String country, String capital, VoidCallback onPressed) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              SizedBox(width: 10),
              Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(flag),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      country,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      capital,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

