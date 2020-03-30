import 'package:flutter/material.dart';

class PlantSearch extends StatefulWidget {
  PlantSearch({Key key}) : super(key: key);

  @override
  _PlantSearchState createState() => _PlantSearchState();

}

class _PlantSearchState extends State<PlantSearch> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search')
      ),
      body: Center(
        child: Text('Page Under Maintenance'),
      ),
    );
  }
  
}
  