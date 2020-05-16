import 'package:flutter/material.dart';
import 'package:flutter_onboarding/widget/logo.dart';
import 'package:flutter_onboarding/constants.dart';

class Header extends StatelessWidget {
  final VoidCallback onSkip;

  const Header({Key key, @required this.onSkip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Logo(
          color: white,
          size: 32.0,
        ),
        GestureDetector(
          onTap: onSkip,
          child: Text("Skip",
              style:
                  Theme.of(context).textTheme.subtitle.copyWith(color: white)),
        )
      ],
    );
  }
}
