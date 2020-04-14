import 'dart:convert';
import 'package:flutter/services.dart';

class Disease {
  final String id;
  final String name;
  final String point1;
  final String point2;
  final String point3;
  final String point4;
  final String point5;

  Disease(
      {this.id,
      this.name,
      this.point1,
      this.point2,
      this.point3,
      this.point4,
      this.point5});

  factory Disease.fromJson(Map<String, dynamic> json) => Disease(
        id: json["id"],
        name: json["name"],
        point1: json["point1"],
        point2: json["point2"],
        point3: json["point3"],
        point4: json["point4"],
        point5: json["point5"],
      );
}

List<Disease> diseaseListFromJson(String str) {
  final jsonData = json.decode(str)['diseases'];
  return List<Disease>.from(jsonData.map((x) => Disease.fromJson(x)));
}

Future<List<Disease>> getDiseaseList() async{
  return diseaseListFromJson(await rootBundle.loadString('assets/data/diseaseinfo.json'));
}
