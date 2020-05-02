import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:folium_snap/models/plant_model.dart';
import 'package:url_launcher/url_launcher.dart';

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
        title: Text("Plant Details"),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          plant.name,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      pointText(plant.point1),
                      pointText(plant.point2),
                      pointText(plant.point3),
                      pointText(plant.point4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            child: Text("Know more..",
                            style: TextStyle(
                              fontSize:20,
                              color: Colors.blue[300],
                            ),),
                            onPressed: () => _launchURL(plant.link),
                          ),
                        ],
                      ),
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

Widget pointText(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      "$text",
      style: TextStyle(
        fontSize: 25,
        color: Colors.black54,
      ),
    ),
  );
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  print("clicked");
}