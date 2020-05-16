import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/screens/onboarding/widgets/cards_stack.dart';

class OnboardingPage extends StatelessWidget {
  final Widget textColumn;
  final Widget darkCardChild;
  final Widget lightCardChild;

  final int pageNumber;

  const OnboardingPage(
      {Key key,
      @required this.textColumn,
      @required this.darkCardChild,
      @required this.lightCardChild,
      @required this.pageNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardsStack(
          darkCardChild: darkCardChild,
          lightCardChild: lightCardChild,
          pageNumber: pageNumber,
        ),
        SizedBox(height: pageNumber % 2 == 1 ? 50.0 : 25.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingL),
          child: textColumn,
        ),
      ],
    );
  }
}
