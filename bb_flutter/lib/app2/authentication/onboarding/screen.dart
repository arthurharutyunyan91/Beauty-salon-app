import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/resources/RColors.dart';
import 'package:flutter_app/widget/button/outline_button.dart';
import 'package:flutter_app/widget/text/clickable_underline_text.dart';
import 'package:get/get.dart';

import 'controller.dart';

class OnBoardingScreen extends StatelessWidget {
  final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<OnBoardingController>(builder: (_) {
      return Stack(
        children: [
          _CarouselSlider(
            onPageChanged: (index) => controller.onPageChange(index),
          ),
          _CarouselInfo(index: controller.index),
          _AuthActions(
              onSignIn: controller.navigateToSignIn,
              onSignUp: controller.navigateToSignUp,
              onSignInLater: controller.navigateToMain)
        ],
      );
    }));
  }
}

///Carousel slider with built in background image list
class _CarouselSlider extends StatelessWidget {
  final Function(int) onPageChanged;

  final List<_BackgroundImageWithOverlay> backgroundList = [
    for (int i = 1; i < 6; i++)
      _BackgroundImageWithOverlay('assets/images/onBoarding0$i.jpg')
  ];

  _CarouselSlider({Key key, this.onPageChanged})
      : assert(onPageChanged != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetHeight = MediaQuery.of(context).size.height;
    return CarouselSlider(
      items: backgroundList,
      height: widgetHeight,
      viewportFraction: 1.0,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 5),
      pauseAutoPlayOnTouch: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 1200),
      onPageChanged: onPageChanged,
    );
  }
}

///Carousel info with built in phrase list + logo
class _CarouselInfo extends StatelessWidget {
  final int index;

  final sentenceList = [
    'Book your next appointment',
    'Get all the relevant information before arriving to the salon',
    'Discover the best beauty salons near you',
    'Make a beauty salon reservation online',
    'Discover the best beauty salons near you',
  ];
  final logoAssetPath = 'assets/images/logo.png';

  _CarouselInfo({Key key, @required this.index})
      : assert(index != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              logoAssetPath,
              width: 80,
              height: 80,
              color: RColors.primaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                sentenceList[index],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BackgroundImageWithOverlay extends StatelessWidget {
  final String imageAsset;

  _BackgroundImageWithOverlay(this.imageAsset);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            imageAsset,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: RColors.blackTransparentOverlay1,
        ),
      ],
    );
  }
}

class _AuthActions extends StatelessWidget {
  final Function onSignIn;
  final Function onSignUp;
  final Function onSignInLater;

  _AuthActions({
    @required this.onSignIn,
    @required this.onSignUp,
    @required this.onSignInLater,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 50,
        right: 50,
        bottom: 32,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: OutlineButtonWidget(
              fill: true,
              textColor: Colors.black,
              text: 'Sign in',
              onTap: onSignIn,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: OutlineButtonWidget(
              text: 'Sign up',
              onTap: onSignUp,
            ),
          ),
          ClickableUnderlineTextWidget(
              text: 'Sign in later', onTap: onSignInLater),
        ],
      ),
    );
  }
}
