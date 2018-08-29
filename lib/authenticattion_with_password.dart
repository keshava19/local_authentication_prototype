import 'package:flutter/material.dart';
import 'package:local_authentication_prototype/authenticated_screen.dart';

class PasswordAuthentication extends StatefulWidget {
  PasswordAuthentication({Key key, this.title}):super(key: key);

  final String title;
  _PasswordAuthentication createState() => new _PasswordAuthentication();
}

class _PasswordAuthentication extends State<PasswordAuthentication> {

  final _formKey = new GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: new Form(
          key: _formKey,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: 180.0,
                child: new TextFormField(
                  validator: (value) {
                    if(value.isEmpty || value.length < 4)
                      return 'Please enter 4 digit PIN';
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  obscureText: true,
                  maxLengthEnforced: true,
                  decoration: InputDecoration(
                    labelText: 'Enter 4 digit PIN',
                  ),
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(16.0),
                child: new RaisedButton(
                  onPressed: () {
                    if(_formKey.currentState.validate()) {
                      Navigator.of(context).push(
                       new MaterialPageRoute(builder: (context) => new Authenticated(title: widget.title,)),
                      );
                    }
                  },
                  child: Text('Authenticate'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}