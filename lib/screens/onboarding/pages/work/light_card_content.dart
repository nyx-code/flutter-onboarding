import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/screens/onboarding/widgets/icon_container.dart';

class WorkLightCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconContainer(
          icon: Icons.event_seat,
          padding: paddingS,
        ),
        IconContainer(
          icon: Icons.business_center,
          padding: paddingM,
        ),
        IconContainer(
          icon: Icons.assessment,
          padding: paddingS,
        ),
      ],
    );
  }
}
