import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/screens/login/widgets/BlueTopClipper.dart';
import 'package:flutter_onboarding/screens/login/widgets/GreyTopClipper.dart';
import 'package:flutter_onboarding/screens/login/widgets/LoginForm.dart';
import 'package:flutter_onboarding/screens/login/widgets/WhiteTopClipper.dart';
import 'package:flutter_onboarding/screens/login/widgets/header.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WhiteTopClipper(),
            child: Container(
              color: grey,
            ),
          ),
          ClipPath(
            clipper: GreyTopClipper(),
            child: Container(
              color: blue,
            ),
          ),
          ClipPath(
            clipper: BlueTopClipper(),
            child: Container(
              color: white,
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                HeaderLogin(),
                Spacer(),
                LoginForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
