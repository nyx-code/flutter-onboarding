import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/widget/logo.dart';

class HeaderLogin extends StatelessWidget {
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
          Text(
            "Welcome to Busble",
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(color: black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: spaceS),
          Text(
            "Lorem ispmu sag fas ugasdyg aywuwa, ndcusd ihadakjsb",
            style: Theme.of(context)
                .textTheme
                .subtitle
                .copyWith(color: black.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
