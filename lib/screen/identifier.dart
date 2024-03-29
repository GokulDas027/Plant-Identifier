import 'dart:math' as math;
import 'package:tflite/tflite.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:folium_snap/utilities/camera.dart';
import 'package:folium_snap/screen/plant_profile.dart';
import 'package:folium_snap/utilities/boundingbox.dart';

class IdentifierPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  IdentifierPage({Key key, this.cameras}) : super(key: key);

  @override
  _IdentifierPageState createState() => _IdentifierPageState();
}

class _IdentifierPageState extends State<IdentifierPage> {
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "MobileNet";
  bool _visible = true;

  loadModel() async {
    String res;
    res = await Tflite.loadModel(
      model: "assets/tflite/mobilenetv2_leaf1.tflite",
      labels: "assets/tflite/mobilenetv2_leaf1.txt",
    );
    print(res);
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    void _toggle() {
      setState(() {
        _visible = !_visible;
        print(_visible);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Leaf Scanner"),
      ),
      body: Stack(
        children: [
          Camera(
            widget.cameras,
            _model,
            setRecognitions,
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Visibility(
              visible: _visible,
              child: FlatButton(
                onPressed: () => _toggle(),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Ensure proper lighting  ",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                    Icon(Icons.close,
                    color: Colors.white70,),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PlantProfile(
                    title: _recognitions[0]["label"],
                  ),
                ),
              );
            },
            child: BndBox(
              _recognitions == null ? [] : [_recognitions[0]],
              math.max(_imageHeight, _imageWidth),
              math.min(_imageHeight, _imageWidth),
              screen.height,
              screen.width,
              _model,
            ),
          ),
        ],
      ),
    );
  }
}
