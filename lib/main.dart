import 'package:flutter/material.dart';
import 'package:flutter_onboarding/screens/login/login.dart';
import 'package:flutter_onboarding/screens/onboarding/onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Builder(
          builder: (BuildContext context) {
            var screenHeight = MediaQuery.of(context).size.height;

            return Onboarding(
              screenHeight: screenHeight,
            );
          },
        ));
  }
}
