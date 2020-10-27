class Country {
  String name;
  String imageUrl;

  Country({this.name, this.imageUrl});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(name: json['name'], imageUrl: json['image_url']);
  }
}
