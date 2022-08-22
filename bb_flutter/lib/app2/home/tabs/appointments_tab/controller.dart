import 'package:flutter_app/app2/home/main/controller.dart';
import 'package:flutter_app/app2/home/tabs/search_tab/controller.dart';
import 'package:flutter_app/app2/make_appointment/screen.dart';
import 'package:flutter_app/model/appointment.dart';
import 'package:flutter_app/model/service.dart';
import 'package:flutter_app/model/staffer.dart';
import 'package:get/get.dart';

import '../../../../model/business.dart';

class AppointmentsTabController extends GetxController {
  MainController _mainController = Get.find();
  var appointments = <Appointment>[];

  AppointmentsTabController() {
    appointments = _mainController.appointments;
    update();
  }

  bookAgain({Business business, Service service, Staffer staffer}) {
    Get.to(MakeAppointmentScreen(
        business: business, service: service, staffer: staffer));
  }
}
