import 'package:flutter_app/app2/pick_staff/screen.dart';
import 'package:flutter_app/app2/portfolio/screen.dart';
import 'package:flutter_app/model/staffer.dart';
import 'package:get/get.dart';
import '../../../../model/business.dart';
import '../../../../model/service.dart';
import '../../main/controller.dart';

class DetailsTabController extends GetxController {
  final DetailsMainController detailsMainController = Get.find();

  Business get business => detailsMainController.business;

  goToPickStaff(Service service) {
    Get.to(PickStaffScreen(
        business: detailsMainController.business, service: service));
  }

  goToPortfolio(Staffer staffer) {
    Get.to(PortfolioScreen(
        business: detailsMainController.business, staffer: staffer));
  }
}
