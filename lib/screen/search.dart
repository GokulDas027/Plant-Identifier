import 'package:flutter/material.dart';
import 'package:folium_snap/screen/plant_profile.dart';

class PlantSearch extends StatefulWidget {
  PlantSearch({Key key}) : super(key: key);

  @override
  _PlantSearchState createState() => _PlantSearchState();
}

class _PlantSearchState extends State<PlantSearch> {
  List<String> entries = <String>['AAAAA', 'BBBBB', 'CCCCC', 'DDDDD'];
  List<String> filterEntries = List();

  @override
  void initState() {
    super.initState();
    filterEntries = entries;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                hintText: "Hii, How're you feeling?",
              ),
              onChanged: (string) {
                setState(() {
                  filterEntries = entries
                      .where((u) =>
                          (u.toLowerCase().contains(string.toLowerCase())))
                      .toList();
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: filterEntries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlantProfile(
                              title: filterEntries[index],
                            ),
                          ),
                        );
                      },
                      splashColor: Colors.greenAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Center(
                          child: Text(
                            '${filterEntries[index]}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
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
