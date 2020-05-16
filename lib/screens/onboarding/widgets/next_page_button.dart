import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextPageButton({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.all(paddingM),
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: white,
      child: Icon(
        Icons.arrow_forward,
        color: blue,
        size: 32.0,
      ),
      onPressed: onPressed,
    );
  }
}
