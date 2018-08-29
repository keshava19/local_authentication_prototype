import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_authentication_prototype/authenticated_screen.dart';
import 'package:local_authentication_prototype/authenticattion_with_password.dart';

class NextScreen extends StatefulWidget {
  NextScreen({Key key, this.title}):super(key : key);

  final String title;

  @override
  _NextScreen createState() => new _NextScreen();
}

class _NextScreen extends State<NextScreen> {

  Future<Null> _authenticate() async {
    final LocalAuthentication auth = new LocalAuthentication();
    bool authenticated = false;

    try{
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: false);
    } on PlatformException catch(e) {
      print(e);
    }
    if(!mounted) return;

    //TODO: Write code to move to next screen
    if(authenticated) {
      Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) => new Authenticated(title: widget.title,)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.all(8.0),
              width: 250.0,
              child: new RaisedButton.icon(
                onPressed: _authenticate,
                icon: new Icon(Icons.fingerprint),
                label: new Text('Authenticate with Fingerprint'),
              ),
            ),
            new Container(
              margin: EdgeInsets.all(8.0),
              width: 250.0,
              child: new RaisedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) => new PasswordAuthentication(title: widget.title,)),
                  );
                },
                icon: new Icon(Icons.lock_outline),
                label: new Text('Authenticate with PIN'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}