import 'package:flutter/material.dart';
import 'package:shopping_for_friends/services/auth.dart';
import 'package:shopping_for_friends/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //Text Field State
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign Up to Shopping for friends'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Login'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            SizedBox(height: 20.0),
            TextFormField(
                validator: (val) => val.isEmpty ? 'Enter a email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                }),
            SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              validator: (val) =>
                  val.length < 6 ? 'Enter a password 6+ chars long' : null,
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
            SizedBox(height: 20.0),
            loading
                ? Loading()
                : RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() => loading = true);
                        dynamic result = await _auth
                            .registerWithEmailandPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'please supply a valid email';
                            loading = false;
                          });
                        }
                      }
                    },
                    color: Colors.pink[400],
                    child: Text('Register',
                        style: TextStyle(color: Colors.white))),
            SizedBox(
              height: 12.0,
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            )
          ]),
        ),
      ),
    );
  }
}
