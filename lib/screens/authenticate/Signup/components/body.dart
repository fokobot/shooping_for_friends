import 'package:flutter/material.dart';
import 'package:shopping_for_friends/screens/authenticate/Login/login_screen.dart';
import 'package:shopping_for_friends/screens/authenticate/Signup/components/background.dart';
import 'package:shopping_for_friends/screens/authenticate/Signup/components/or_divider.dart';
import 'package:shopping_for_friends/screens/authenticate/Signup/components/social_icon.dart';
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

  //Text Field State
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
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
                    "SIGNUP",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/signup.svg",
                    height: size.height * 0.35,
                  ),
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
                    text: "SIGNUP",
                    press: () async {
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailandPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = 'please supply a valid email';
                          loading = false;
                        });
                      }else{
                        Navigator.pop(context);
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                  ),
                  OrDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocalIcon(
                        iconSrc: "assets/icons/facebook.svg",
                        press: () {},
                      ),
                      SocalIcon(
                        iconSrc: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                      SocalIcon(
                        iconSrc: "assets/icons/google-plus.svg",
                        press: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
