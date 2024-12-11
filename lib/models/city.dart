class City {
  String? country;
  String? name;
  int? area;
  int? population;
  late bool isFavorite = false;

  City({
    this.country,
    this.name,
    this.area,
    this.population,
    required this.isFavorite});

  City.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    name = json['name'];
    area = json['area'];
    population = json['population'];
  }
}

