import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:folium_snap/models/disease_model.dart';
// import 'package:folium_snap/screen/plant_profile.dart';

class PlantSearch extends StatefulWidget {
  PlantSearch({Key key}) : super(key: key);

  @override
  _PlantSearchState createState() => _PlantSearchState();
}

class _PlantSearchState extends State<PlantSearch> {
  List<Disease> diseaseList = List();
  List<Disease> filterDiseaseList = List();

  Future<Null> getDiseaseData() async {
    final response =
        await rootBundle.loadString('assets/data/diseaseinfo.json');
    final responseJson = json.decode(response)['diseases'];

    setState(() {
      for (Map user in responseJson) {
        diseaseList.add(Disease.fromJson(user));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getDiseaseData();
    filterDiseaseList = diseaseList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                hintText: "Hii, How're you feeling?",
              ),
              onChanged: (string) {
                setState(() {
                  filterDiseaseList = diseaseList
                      .where((u) =>
                          (u.name.toLowerCase().contains(string.toLowerCase())))
                      .toList();
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filterDiseaseList.length,
                itemBuilder: (BuildContext context, int index) {
                  Disease disease = filterDiseaseList[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:8.0),
                            child: Text(
                              disease.name,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          pointText(disease.point1),
                          pointText(disease.point2),
                          pointText(disease.point3),
                          pointText(disease.point4),
                          pointText(disease.point5),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget pointText(String text) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Text(
      "* $text",
      style: TextStyle(
        fontSize: 18,
      ),
    ),
  );
}
