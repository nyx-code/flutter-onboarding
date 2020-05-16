import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class CommunityDarkCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: paddingL),
          child: Icon(
            Icons.brush,
            color: white,
            size: 32.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: paddingL),
          child: Icon(
            Icons.camera_alt,
            color: white,
            size: 32.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: paddingL),
          child: Icon(
            Icons.straighten,
            color: white,
            size: 32.0,
          ),
        )
      ],
    );
  }
}
