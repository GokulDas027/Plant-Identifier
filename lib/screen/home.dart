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
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipPath(
            clipper: RoundClipper(),
            child: Container(
              height: height/1.75,  //370,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.green[600],
                    Colors.green[300],
                    // Theme.of(context).primaryColor,
                    // Theme.of(context).primaryColorLight,
                  ],
                ),
              ),
              child: FlatButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/launcher_icon.png",
                      scale: 1,
                    ),
                    SizedBox(height: 25),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUs(),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 8),
                  blurRadius: 24,
                  color: Colors.grey[300],
                ),
              ],
            ),
            child: FlatButton(
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
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    Icons.camera_alt,
                    size: 60,
                    color: Theme.of(context).primaryColor,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Scan the Leaf  ',
                        style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        '  Ensure lighting & alignment',
                        style: TextStyle(
                          fontSize: 17,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 8),
                  blurRadius: 24,
                  color: Colors.grey[300],
                ),
              ],
            ),
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlantSearch()),
                );
              },
              splashColor: Theme.of(context).accentColor,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    Icons.search,
                    size: 60,
                    color: Theme.of(context).primaryColor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '  Search for Cure ',
                        style: TextStyle(
                          fontSize: 29,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        '   Search for the disease',
                        style: TextStyle(
                          fontSize: 17,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
