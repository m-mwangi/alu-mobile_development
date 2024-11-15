class Country {
  final String name;
  final String capital;
  final int population;
  final String region;
  final String flagUrl;
  final List<String> borders;

  Country({
    required this.name,
    required this.capital,
    required this.population,
    required this.region,
    required this.flagUrl,
    required this.borders,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'],
      capital: json['capital'] != null ? json['capital'][0] : 'N/A',
      population: json['population'],
      region: json['region'],
      flagUrl: json['flags']['png'],
      borders: List<String>.from(json['borders'] ?? []),
    );
  }
}
