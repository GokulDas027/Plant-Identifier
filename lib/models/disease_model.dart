import 'dart:convert';

class Disease {
  final int id;
  final String name;
  final String description;

  Disease({this.id, this.name, this.description});

  factory Disease.fromJson(Map<String, dynamic> json) => Disease(
    id: json["id"],
    name: json["name"],
    description: json["description"],
  );
}

List<Disease> diseaseListFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Disease>.from(jsonData.map((x) => Disease.fromJson(x)));
}
