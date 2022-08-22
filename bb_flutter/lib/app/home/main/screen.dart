import 'package:flutter_app/resources/RColors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../tabs/appointments_tab/screen.dart';
import '../tabs/favorites_tab/screen.dart';
import '../tabs/home_tab/screen.dart';
import '../tabs/search_tab/screen.dart';
import 'controller.dart';

class MainScreen extends StatelessWidget {
  final MainController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      HomeTab2(),
      SearchTab2(),
      FavoritesTab2(),
      AppointmentsTab2(),
      Container(),
      // ProfileTab(),
    ];

    return GetBuilder<MainController>(builder: (_) {
      return Scaffold(
          body: PersistentTabView(
        context,
        items: navBarsItems(),
        screens: _children,
        controller: controller.navBarController,
        navBarStyle: NavBarStyle.style12,
        backgroundColor: Colors.black26,
        resizeToAvoidBottomInset: true,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 500),
        ),
      ));
    });
  }
}

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: '',
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.white70,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.search),
      title: '',
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.white70,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.favorite),
      title: '',
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.white70,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.book),
      title: '',
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.white70,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.person),
      title: '',
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.white70,
    ),
  ];
}
