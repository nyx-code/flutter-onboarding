import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Widget image;
  final Color color;
  final Color textColor;

  const CustomButton({
    Key key,
    @required this.onPressed,
    @required this.text,
    @required this.image,
    @required this.color,
    @required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity,
      ),
      child: image != null
          ? OutlineButton(
              onPressed: onPressed,
              color: color,
              padding: EdgeInsets.symmetric(
                  vertical: paddingS, horizontal: paddingM),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: paddingL),
                    child: image,
                  ),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.subtitle.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            )
          : FlatButton(
              onPressed: onPressed,
              color: color,
              padding: EdgeInsets.all(paddingM),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              child: Text(
                text,
                style: Theme.of(context).textTheme.subtitle.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
    );
  }
}
