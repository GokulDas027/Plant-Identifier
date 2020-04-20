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
          GestureDetector(
            onTap: () {
              Navigator.push(
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
