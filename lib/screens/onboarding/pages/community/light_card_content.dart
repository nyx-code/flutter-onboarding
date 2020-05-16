import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/screens/onboarding/widgets/icon_container.dart';

class CommunityLightCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconContainer(
          icon: Icons.person,
          padding: paddingS,
        ),
        IconContainer(
          icon: Icons.group,
          padding: paddingM,
        ),
        IconContainer(
          icon: Icons.insert_emoticon,
          padding: paddingS,
        ),
      ],
    );
  }
}
