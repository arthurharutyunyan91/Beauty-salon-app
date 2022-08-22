import 'package:flutter_app/model/staffer.dart';
import 'package:get/get.dart';
import '../../model/business.dart';
import '../../model/service.dart';
import '../make_appointment/screen.dart';
import '../portfolio/screen.dart';

class PickStaffController extends GetxController {
  final Business business;
  final Service service;

  PickStaffController(this.business, this.service);

  goToPortfolio(Staffer staffer) {
    Get.to(PortfolioScreen(
      business: business,
      service: service,
      staffer: staffer,
    ));
  }

  goToMakeAppointment(Staffer staffer) {
    Get.to(MakeAppointmentScreen(
      business: business,
      service: service,
      staffer: staffer,
    ));
  }
}
