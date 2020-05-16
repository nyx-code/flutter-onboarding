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
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
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
        );
      case 2:
        return OnboardingPage(
          textColumn: EducationTextColumn(),
          darkCardChild: EducationDarkCardContent(),
          lightCardChild: EducationLightCardContent(),
          pageNumber: 2,
        );
      case 3:
        return OnboardingPage(
          textColumn: WorkTextColumn(),
          darkCardChild: WorkDarkCardContent(),
          lightCardChild: WorkLightCardContent(),
          pageNumber: 3,
        );
      default:
        throw Exception("Page with number '$_currentPage' does not exist.");
    }
  }

  void _setNextPage(int nextPageNumber) {
    setState(() {
      _currentPage = nextPageNumber;
    });
  }

  void _nextPage() {
    switch (_currentPage) {
      case 1:
        _setNextPage(2);
        break;
      case 2:
        _setNextPage(3);
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
