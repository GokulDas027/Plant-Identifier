import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton( 
              onPressed: () => {},
              splashColor: Theme.of(context).accentColor,
              padding: EdgeInsets.symmetric(vertical:40, horizontal:90),
              child: Column(
                children: <Widget>[
                  Icon(Icons.camera_alt, size: 120,),
                  Text('Scan',
                  style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            FlatButton( 
              onPressed: () => {},
              splashColor: Theme.of(context).accentColor,
              padding: EdgeInsets.symmetric(vertical:40, horizontal:90),
              child: Column(
                children: <Widget>[
                  Icon(Icons.search, size: 120,),
                  Text('Search', 
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),),
    );
  }

}