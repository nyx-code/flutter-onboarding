import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/screens/onboarding/widgets/icon_container.dart';

class EducationLightCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconContainer(
          icon: Icons.brush,
          padding: paddingS,
        ),
        IconContainer(
          icon: Icons.camera_alt,
          padding: paddingM,
        ),
        IconContainer(
          icon: Icons.straighten,
          padding: paddingS,
        ),
      ],
    );
  }
}
