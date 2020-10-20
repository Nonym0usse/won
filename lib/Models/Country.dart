class Country {
  int id;
  String name;
  String imageUrl;

  Country({this.id, this.name, this.imageUrl});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(name: json['name'], imageUrl: json['image_url']);
  }
}
