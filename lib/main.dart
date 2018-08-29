import 'package:flutter/material.dart';
import 'package:local_authentication_prototype/authenticationScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Local Authentication',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new NextScreen(title: 'Flutter Local Authentication',),
    );
  }
}