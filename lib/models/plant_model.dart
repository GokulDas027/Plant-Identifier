class Plant {
  final String id;
  final String name;
  final String sciName;
  final String point1;
  final String point2;
  final String point3;
  final String point4;
  final String link;

  Plant(
      {this.id,
      this.name,
      this.sciName,
      this.point1,
      this.point2,
      this.point3,
      this.point4,
      this.link});

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
      id: json["id"],
      name: json["name"],
      sciName: json["sci_name"],
      point1: json["point1"],
      point2: json["point2"],
      point3: json["point3"],
      point4: json["point4"],
      link: json["link"]
    );
}
