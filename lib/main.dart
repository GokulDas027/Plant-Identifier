import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:folium_snap/screen/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    return MaterialApp(
      // project title
      title: 'Obtection',
      // project theme
      theme: ThemeData(
        primarySwatch: Colors.green,
        secondaryHeaderColor: Colors.greenAccent,
      ),
      home: HomePage(title: 'Folium Snap'),
    );
  }
}
