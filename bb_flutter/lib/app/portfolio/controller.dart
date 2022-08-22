import 'package:flutter_app/model/staffer.dart';
import 'package:get/get.dart';
import '../../model/business.dart';
import '../../model/service.dart';
import '../make_appointment/screen.dart';
import '../portfolio/screen.dart';

class PortfolioController extends GetxController {
  final Business business;
  final Service service;

  PortfolioController({this.business, this.service});

  goToMakeAppointment(Staffer staffer) {
    Get.to(MakeAppointmentScreen(
      business: business,
      service: service,
      staffer: staffer,
    ));
  }
}
