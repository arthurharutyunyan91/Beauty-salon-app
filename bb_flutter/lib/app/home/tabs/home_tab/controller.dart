import 'package:flutter_app/app/home/main/controller.dart';
import 'package:flutter_app/app/home/tabs/search_tab/controller.dart';
import 'package:flutter_app/app/portfolio/screen.dart';
import 'package:flutter_app/model/staffer.dart';
import 'package:get/get.dart';

class HomeTabController extends GetxController {
  MainController _mainController = Get.find();
  var _searchTabController = Get.put(SearchTabController());

  goToCategory(String category) {
    _searchTabController.updateBusinessesByCategory(category);
    _mainController.changeNavIndex(1);
  }

  goToPortfolio(Staffer staffer) {
    Get.to(PortfolioScreen(staffer: staffer));
  }
}
