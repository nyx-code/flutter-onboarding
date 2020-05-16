import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class WorkDarkCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.person_pin,
          size: 32.0,
          color: white,
        ),
        const SizedBox(height: spaceM),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.person,
              size: 32.0,
              color: white,
            ),
            Icon(
              Icons.group,
              size: 32.0,
              color: white,
            ),
            Icon(
              Icons.insert_emoticon,
              size: 32.0,
              color: white,
            ),
          ],
        ),
      ],
    );
  }
}
