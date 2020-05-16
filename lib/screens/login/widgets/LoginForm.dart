import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/screens/login/widgets/CustomButton.dart';
import 'package:flutter_onboarding/screens/login/widgets/CustomInputField.dart';
import 'package:flutter_onboarding/screens/login/widgets/FadeSlideTrasition.dart';

class LoginForm extends StatelessWidget {
  final Animation<double> animation;

  const LoginForm({Key key, @required this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? spaceM : spaceS;

    return Padding(
      padding: const EdgeInsets.fromLTRB(paddingL, 0.0, paddingL, paddingL),
      child: Column(
        children: <Widget>[
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: CustomInputField(
              prefixIcon: Icons.person,
              label: "Username or Email",
              obscureText: false,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: space,
            child: CustomInputField(
              prefixIcon: Icons.lock,
              label: "Password",
              obscureText: false,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 2 * space,
            child: CustomButton(
              text: "Login to continue",
              color: blue,
              onPressed: () {},
              image: null,
              textColor: white,
            ),
          ),
          SizedBox(height: space * 2),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 3 * space,
            child: CustomButton(
              text: "Continue with Google",
              color: white,
              onPressed: () {},
              image: Image(
                image: AssetImage(GoogleImage),
                height: 32.0,
              ),
              textColor: black.withOpacity(0.5),
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 4 * space,
            child: CustomButton(
              text: "Create Bubble Account",
              color: black,
              onPressed: () {},
              image: null,
              textColor: white,
            ),
          ),
        ],
      ),
    );
  }
}
