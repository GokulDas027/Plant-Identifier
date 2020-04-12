import 'dart:convert';

class Plant {
  final int id;
  final String name;
  final String description;
  final bool isEdible;

  Plant({this.id, this.name, this.description, this.isEdible});

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    isEdible:  json["edible"]
  );
}

List<Plant> plantListFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Plant>.from(jsonData.map((x) => Plant.fromJson(x)));
}
