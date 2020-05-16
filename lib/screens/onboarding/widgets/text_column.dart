import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class TextColumn extends StatelessWidget {
  final String title;
  final String text;

  const TextColumn({Key key, @required this.title, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline
              .copyWith(color: white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: spaceS),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle.copyWith(color: white),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
