import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:folium_snap/models/plant_model.dart';

class PlantProfile extends StatefulWidget {
  final String title;
  PlantProfile({Key key, this.title}) : super(key: key);

  @override
  _PlantProfileState createState() => _PlantProfileState();
}

class _PlantProfileState extends State<PlantProfile> {
  List<Plant> plantsList = List();
  List<Plant> thisPlant = List();

  Future<Null> getPlantsData() async {
    final response = await rootBundle.loadString('assets/data/plants.json');
    final responseJson = json.decode(response)['plants'];
    setState(() {
      for (Map user in responseJson) {
        plantsList.add(Plant.fromJson(user));
      }
      thisPlant = plantsList
          .where((u) =>
              (u.name.toLowerCase().contains(widget.title.toLowerCase())))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getPlantsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: thisPlant.length,
              itemBuilder: (BuildContext context, int index) {
                Plant plant = thisPlant[index];
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Text(plant.name),
                      Text(plant.point1),
                      Text(plant.point2),
                      Text(plant.point3),
                      Text(plant.point4),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
