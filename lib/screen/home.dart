import 'identifier.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:folium_snap/screen/search.dart';
import 'package:folium_snap/screen/about_us.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    List<CameraDescription> cameras;

    Future<Null> camCheck() async {
      WidgetsFlutterBinding.ensureInitialized();
      try {
        WidgetsFlutterBinding.ensureInitialized();
        cameras = await availableCameras();
        print("camera kitti");
      } on CameraException catch (e) {
        print('Error: $e.code\nError Message: $e.message');
      }
    }

    camCheck();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Image.asset("assets/images/launcher_icon.png"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUs(),
                ),
              );
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IdentifierPage(
                        cameras: cameras,
                      ),
                    ),
                  );
                },
                splashColor: Theme.of(context).accentColor,
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 90),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.camera_alt,
                      size: 120,
                    ),
                    Text(
                      'Scan',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlantSearch()),
                  );
                },
                splashColor: Theme.of(context).accentColor,
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 90),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      size: 120,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
