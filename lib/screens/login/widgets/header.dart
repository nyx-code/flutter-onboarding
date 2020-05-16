import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/screens/login/widgets/FadeSlideTrasition.dart';
import 'package:flutter_onboarding/widget/logo.dart';

class HeaderLogin extends StatelessWidget {
  final Animation<double> animation;

  const HeaderLogin({
    Key key,
    @required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(paddingL, paddingL, paddingL, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Logo(
            color: blue,
            size: 48.0,
          ),
          const SizedBox(height: spaceM),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: Text(
              "Welcome to Busble",
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(color: black, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: spaceS),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 16.0,
            child: Text(
              "Lorem ispmu sag fas ugasdyg aywuwa, ndcusd ihadakjsb",
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: black.withOpacity(0.5)),
            ),
          ),
        ],
      ),
    );
  }
}
