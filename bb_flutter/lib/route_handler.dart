// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_app/app/authentication/page/on_boarding.dart';
// import 'package:flutter_app/app/authentication/page/sign_in.dart';
// import 'package:flutter_app/app/authentication/page/sign_up.dart';
// import 'package:flutter_app/app/detail/page/make_appointment_page.dart';
// import 'package:flutter_app/app/detail/page/pick_staff_page.dart';
// import 'package:flutter_app/app/detail/page/salon_details_page.dart';
// import 'package:flutter_app/app/home/page/home_screen.dart';
// import 'package:flutter_app/map.dart';
// import 'package:flutter_app/model/business.dart';
// import 'package:flutter_app/model/service.dart';
// import 'package:flutter_app/model/staffer.dart';
// import 'package:flutter_app/verification.dart';
//
// import 'app/detail/page/portfolio_page.dart';
//
// RouteFactory routeHandler = (RouteSettings settings) {
//   final args = settings.arguments;
//   switch (settings.name) {
//     case SignInPage.routeName:
//       return SignInPage.route();
//     case SignUpPage.routeName:
//       return SignUpPage.route();
//     case VerificationPage.verificationRoute:
//       return _verificationPageRout(args);
//     case OnBoardingPage.routeName:
//       return OnBoardingPage.route();
//     case HomePage.routeName:
//       return HomePage.route();
//     case MapPage.routeName:
//       return MapPage.route(businessList: (args as MapArgs).list);
//     case BusinessDetailsPage.routeName:
//       return BusinessDetailsPage.route(
//           business: (args as SalonDetailsArgs).item);
//     case PickStaffPage.routeName:
//       return PickStaffPage.route(
//           business: (args as PickStaffArgs).currentSalon,
//           service: (args as PickStaffArgs).service);
//     case PortfolioPage.routeName:
//       return PortfolioPage.route(
//           business: (args as PortfolioArgs).currentSalon,
//           professional: (args as PortfolioArgs).professional,
//           service: (args as PortfolioArgs).service);
//     case MakeAppointmentPage.routeName:
//       return MakeAppointmentPage.route(
//           business: (args as MakeAppointmentArgs).currentSalon,
//           staffer: (args as MakeAppointmentArgs).currentProfessional,
//           service: (args as MakeAppointmentArgs).currentService);
//   }
//   return null;
// };
//
// //TODO TMP
// _verificationPageRout(VerificationArgs args) {
//   return MaterialPageRoute(builder: (BuildContext context) {
//     return VerificationPage(args);
//   });
// }
//
// class MapArgs {
//   final List<Business> list;
//
//   MapArgs(this.list);
// }
//
// class SalonDetailsArgs {
//   final Business item;
//
//   SalonDetailsArgs(this.item);
// }
//
// class PickStaffArgs {
//   final Business currentSalon;
//   final Service service;
//
//   PickStaffArgs(this.currentSalon, this.service);
// }
//
// class PortfolioArgs {
//   final Business currentSalon;
//   final Staffer professional;
//   final Service service;
//
//   PortfolioArgs(this.currentSalon, this.professional, this.service);
// }
//
// class MakeAppointmentArgs {
//   final Business currentSalon;
//   final Service currentService;
//   final Staffer currentProfessional;
//
//   MakeAppointmentArgs(
//       this.currentSalon, this.currentService, this.currentProfessional);
// }
