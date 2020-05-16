import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/screens/login/login.dart';
import 'package:flutter_onboarding/screens/onboarding/pages/community/dark_card_content.dart';
import 'package:flutter_onboarding/screens/onboarding/pages/community/light_card_content.dart';
import 'package:flutter_onboarding/screens/onboarding/pages/community/text_column.dart';
import 'package:flutter_onboarding/screens/onboarding/pages/education/dark_card_content.dart';
import 'package:flutter_onboarding/screens/onboarding/pages/education/light_card_content.dart';
import 'package:flutter_onboarding/screens/onboarding/pages/education/text_column.dart';
import 'package:flutter_onboarding/screens/onboarding/pages/onboarding_page.dart';
import 'package:flutter_onboarding/screens/onboarding/pages/work/dark_card_content.dart';
import 'package:flutter_onboarding/screens/onboarding/pages/work/light_card_content.dart';
import 'package:flutter_onboarding/screens/onboarding/pages/work/text_column.dart';
import 'package:flutter_onboarding/screens/onboarding/widgets/header.dart';
import 'package:flutter_onboarding/screens/onboarding/widgets/next_page_button.dart';
import 'package:flutter_onboarding/screens/onboarding/widgets/onboarding_page_indicator.dart';

class Onboarding extends StatefulWidget {
  final double screenHeight;

  const Onboarding({
    Key key,
    this.screenHeight,
  }) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  AnimationController _cardsAnimationController;
  Animation<Offset> _slideAnimationLightCard;
  Animation<Offset> _slideAnimationDarkCard;

  @override
  void initState() {
    super.initState();
    _cardsAnimationController = AnimationController(
      vsync: this,
      duration: cardAnimationDuration,
    );

    _setCardsSlideInAnimation();
  }

  @override
  void dispose() {
    _cardsAnimationController.dispose();
    super.dispose();
  }

  int _currentPage = 1;

  bool get isFirstPage => _currentPage == 1;

  Widget _getPage() {
    switch (_currentPage) {
      case 1:
        return OnboardingPage(
          textColumn: CommunityTextColumn(),
          darkCardChild: CommunityDarkCardContent(),
          lightCardChild: CommunityLightCardContent(),
          pageNumber: 1,
          lightCardOffsetAnimation: _slideAnimationLightCard,
          darkCardOffsetAnimation: _slideAnimationDarkCard,
        );
      case 2:
        return OnboardingPage(
          textColumn: EducationTextColumn(),
          darkCardChild: EducationDarkCardContent(),
          lightCardChild: EducationLightCardContent(),
          pageNumber: 2,
          lightCardOffsetAnimation: _slideAnimationLightCard,
          darkCardOffsetAnimation: _slideAnimationDarkCard,
        );
      case 3:
        return OnboardingPage(
          textColumn: WorkTextColumn(),
          darkCardChild: WorkDarkCardContent(),
          lightCardChild: WorkLightCardContent(),
          pageNumber: 3,
          lightCardOffsetAnimation: _slideAnimationLightCard,
          darkCardOffsetAnimation: _slideAnimationDarkCard,
        );
      default:
        throw Exception("Page with number '$_currentPage' does not exist.");
    }
  }

  void _setCardsSlideOutAnimation() {
    setState(() {
      _slideAnimationLightCard = Tween<Offset>(
        begin: Offset(3.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeOut,
      ));
      _slideAnimationDarkCard = Tween<Offset>(
        begin: Offset(1.5, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeOut,
      ));
    });
  }

  void _setCardsSlideInAnimation() {
    setState(() {
      _slideAnimationLightCard = Tween<Offset>(
        begin: Offset.zero,
        end: Offset(-3.0, 0.0),
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeIn,
      ));
      _slideAnimationDarkCard = Tween<Offset>(
        begin: Offset.zero,
        end: Offset(-1.5, 0.0),
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeIn,
      ));

      _cardsAnimationController.reset();
    });
  }

  void _setNextPage(int nextPageNumber) {
    setState(() {
      _currentPage = nextPageNumber;
    });
  }

  Future<void> _nextPage() async {
    switch (_currentPage) {
      case 1:
        await _cardsAnimationController.forward();
        _setNextPage(2);
        _setCardsSlideOutAnimation();
        await _cardsAnimationController.forward();
        _setCardsSlideInAnimation();
        break;
      case 2:
        await _cardsAnimationController.forward();
        _setNextPage(3);
        _setCardsSlideOutAnimation();
        await _cardsAnimationController.forward();
        break;
      case 3:
        _goToLogin();
        break;
      default:
    }
  }

  void _goToLogin() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Header(
                onSkip: _goToLogin,
              ),
            ),
            Expanded(
              child: _getPage(),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 50.0),
              child: OnboardingPageIndicator(
                currentPage: _currentPage,
                child: NextPageButton(
                  onPressed: _nextPage,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
