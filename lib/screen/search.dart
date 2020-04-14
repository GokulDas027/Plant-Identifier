import 'package:flutter/material.dart';
import 'package:folium_snap/models/disease_model.dart';
// import 'package:folium_snap/screen/plant_profile.dart';

class PlantSearch extends StatefulWidget {
  PlantSearch({Key key}) : super(key: key);

  @override
  _PlantSearchState createState() => _PlantSearchState();
}

class _PlantSearchState extends State<PlantSearch> {
  Future<List<Disease>> diseaseList = getDiseaseList();
  Future<List<Disease>> filterDiseaseList;

  @override
  void initState() {
    super.initState();
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
              // onChanged: (string) {
              //   setState(() {
              //     filterDiseaseList = diseaseList
              //         .where((u) =>
              //             (u.name.toLowerCase().contains(string.toLowerCase())))
              //         .toList();
              //   });
              // },
            ),
            Expanded(
              child: FutureBuilder(
                future: filterDiseaseList,
                builder: (context, snapshot) {
                  var diseases = snapshot.data ?? [];
                  print(diseases);
                  return ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: diseases.length,
                    itemBuilder: (BuildContext context, int index) {
                      Disease disease = diseases[index];
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Text(disease.name),
                            Text(disease.point1),
                            Text(disease.point2),
                            Text(disease.point3),
                            Text(disease.point4),
                            Text(disease.point5),
                          ],
                        ),
                      );
                    }
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
