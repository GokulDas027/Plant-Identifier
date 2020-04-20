import 'package:flutter/material.dart';

class BndBox extends StatelessWidget {
  final List<dynamic> results;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;
  final String model;

  BndBox(this.results, this.previewH, this.previewW, this.screenH, this.screenW,
      this.model);

  @override
  Widget build(BuildContext context) {
    List<Widget> _renderStrings() {
      double boxHeight;
      return results.map((re) {
        boxHeight = 180.0;
        return Positioned(
          left: 10,
          top: screenH-boxHeight,
          bottom: 20,
          right: 10,
          // width: screenW,
          // height: screenH,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${re["label"]}",
                  style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${(re["confidence"] * 100).toStringAsFixed(0)}%",
                  style: TextStyle(
                    color: Colors.green[800],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList();
    }

    return Stack(
      children: _renderStrings(),
    );
  }
}
