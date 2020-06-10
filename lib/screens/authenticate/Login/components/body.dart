import 'package:flutter/material.dart';
import 'package:shopping_for_friends/screens/authenticate/Login/components/background.dart';
import 'package:shopping_for_friends/screens/authenticate/Signup/signup_screen.dart';
import 'package:shopping_for_friends/screens/components/already_have_an_account_acheck.dart';
import 'package:shopping_for_friends/screens/components/rounded_button.dart';
import 'package:shopping_for_friends/screens/components/rounded_input_field.dart';
import 'package:shopping_for_friends/screens/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_for_friends/services/auth.dart';
import 'package:shopping_for_friends/shared/loading.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();
  //final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //Text Field State
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? Loading()
        : Background(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/login.svg",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(
                    hintText: "Your Email",
                    onChanged: (value) {
                      setState(() => email = value);
                    },
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {
                      setState(() => password = value);
                    },
                  ),
                  RoundedButton(
                    text: "LOGIN",
                    press: () async {
                      setState(() => loading = true);
                      dynamic result = await _auth.signInWithEmailandPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Could not sign In with those credentials';
                          loading = false;
                        });
                      }else{
                        Navigator.pop(context);
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
  }
}
