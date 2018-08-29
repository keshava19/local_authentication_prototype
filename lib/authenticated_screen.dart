import 'package:flutter/material.dart';

class Authenticated extends StatefulWidget {
  Authenticated({Key key, this.title}):super(key: key);

  final String title;

  _AuthenticatedState createState() => new _AuthenticatedState();
}

class _AuthenticatedState extends State<Authenticated> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Text('Successfully Authenticated', style: new TextStyle(fontSize: 32.0),),
          ],
        ),
      ),
    );
  }
}