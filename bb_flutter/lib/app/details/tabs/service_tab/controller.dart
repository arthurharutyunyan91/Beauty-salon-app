import 'package:flutter_app/app/details/main/controller.dart';
import 'package:flutter_app/model/business.dart';
import 'package:flutter_app/model/service.dart';
import 'package:get/get.dart';

import '../../../pick_staff/screen.dart';

class ServiceTabController extends GetxController {
  final DetailsMainController detailsMainController = Get.find();
  Business get business => detailsMainController.business;

  goToPickStaff(Service service) {
    Get.to(PickStaffScreen(
        business: detailsMainController.business, service: service));
  }
}
