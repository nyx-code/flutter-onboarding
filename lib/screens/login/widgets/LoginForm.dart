import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/screens/login/widgets/CustomButton.dart';
import 'package:flutter_onboarding/screens/login/widgets/CustomInputField.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? spaceM : spaceS;

    return Padding(
      padding: const EdgeInsets.fromLTRB(paddingL, 0.0, paddingL, paddingL),
      child: Column(
        children: <Widget>[
          CustomInputField(
            prefixIcon: Icons.person,
            label: "Username or Email",
            obscureText: false,
          ),
          SizedBox(height: space),
          CustomInputField(
            prefixIcon: Icons.lock,
            label: "Password",
            obscureText: false,
          ),
          SizedBox(height: space),
          CustomButton(
            text: "Login to continue",
            color: blue,
            onPressed: () {},
            image: null,
            textColor: white,
          ),
          SizedBox(height: space * 2),
          CustomButton(
            text: "Continue with Google",
            color: white,
            onPressed: () {},
            image: Image(
              image: AssetImage(GoogleImage),
              height: 32.0,
            ),
            textColor: black.withOpacity(0.5),
          ),
          SizedBox(height: space),
          CustomButton(
            text: "Create Bubble Account",
            color: black,
            onPressed: () {},
            image: null,
            textColor: white,
          ),
        ],
      ),
    );
  }
}
