import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class CardsStack extends StatelessWidget {
  final Widget darkCardChild;
  final Widget lightCardChild;
  final int pageNumber;

  const CardsStack(
      {Key key,
      @required this.darkCardChild,
      @required this.lightCardChild,
      @required this.pageNumber})
      : super(key: key);

  bool get isOddPageNumber => pageNumber % 2 == 1;

  @override
  Widget build(BuildContext context) {
    var darkCardWidth = MediaQuery.of(context).size.width - 2 * paddingL;
    var darkCardHeight = MediaQuery.of(context).size.height / 3;

    return Padding(
      padding: EdgeInsets.only(
        top: isOddPageNumber ? 25.0 : 50.0,
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        overflow: Overflow.visible,
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            color: darkBlue,
            child: Container(
              width: darkCardWidth,
              height: darkCardHeight,
              padding: EdgeInsets.only(
                top: !isOddPageNumber ? 100.0 : 0.0,
                bottom: isOddPageNumber ? 100.0 : 0.0,
              ),
              child: darkCardChild,
            ),
          ),
          Positioned(
            top: !isOddPageNumber ? -25.0 : null,
            bottom: isOddPageNumber ? -25.0 : null,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              color: lightBlue,
              child: Container(
                width: darkCardWidth * 0.8,
                height: darkCardHeight * 0.5,
                padding: const EdgeInsets.symmetric(horizontal: paddingM),
                child: Center(
                  child: lightCardChild,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
