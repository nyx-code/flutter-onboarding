import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/screens/login/widgets/BlueTopClipper.dart';
import 'package:flutter_onboarding/screens/login/widgets/GreyTopClipper.dart';
import 'package:flutter_onboarding/screens/login/widgets/LoginForm.dart';
import 'package:flutter_onboarding/screens/login/widgets/WhiteTopClipper.dart';
import 'package:flutter_onboarding/screens/login/widgets/header.dart';

class Login extends StatefulWidget {
  final double screenHeight;

  const Login({
    Key key,
    @required this.screenHeight,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  AnimationController _animationController;

  Animation<double> _headerTextAnimation;
  Animation<double> _formLoginAnimation;
  Animation<double> _whiteClipAnimation;
  Animation<double> _blueClipAnimation;
  Animation<double> _greyClipAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: loginAnimationDuration,
    );

    _fadeSlideAnimation();
    _setClipperAnimation();

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _fadeSlideAnimation() {
    var fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);

    _headerTextAnimation = fadeSlideTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.0,
          0.6,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _formLoginAnimation = fadeSlideTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.7,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );
  }

  void _setClipperAnimation() {
    var clipperOffsetTween = Tween<double>(
      begin: widget.screenHeight,
      end: 0.0,
    );

    _whiteClipAnimation = clipperOffsetTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        0.7,
        curve: Curves.easeInOut,
      ),
    ));

    _blueClipAnimation = clipperOffsetTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.2,
        0.7,
        curve: Curves.easeInOut,
      ),
    ));

    _greyClipAnimation = clipperOffsetTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.35,
        0.7,
        curve: Curves.easeInOut,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: _greyClipAnimation,
            child: Container(
              color: grey,
            ),
            builder: (_, Widget child) {
              return ClipPath(
                clipper: WhiteTopClipper(
                  yOffset: _greyClipAnimation.value,
                ),
                child: child,
              );
            },
          ),
          AnimatedBuilder(
            animation: _blueClipAnimation,
            child: Container(
              color: blue,
            ),
            builder: (_, Widget child) {
              return ClipPath(
                clipper: GreyTopClipper(
                  yOffset: _blueClipAnimation.value,
                ),
                child: child,
              );
            },
          ),
          AnimatedBuilder(
            animation: _whiteClipAnimation,
            child: Container(
              color: white,
            ),
            builder: (_, Widget child) {
              return ClipPath(
                clipper: BlueTopClipper(
                  yOffset: _whiteClipAnimation.value,
                ),
                child: child,
              );
            },
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                HeaderLogin(
                  animation: _headerTextAnimation,
                ),
                Spacer(),
                LoginForm(
                  animation: _formLoginAnimation,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
