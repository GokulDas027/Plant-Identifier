import 'package:flutter/material.dart';

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
                contentPadding: EdgeInsets.all(15.0),
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
                padding: const EdgeInsets.all(8),
                itemCount: filterEntries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: Text(
                          '${filterEntries[index]}',
                          style: TextStyle(fontSize: 20),
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
