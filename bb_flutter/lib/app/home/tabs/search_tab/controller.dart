import 'package:flutter_app/app/home/main/controller.dart';
import 'package:flutter_app/model/business.dart';
import 'package:get/get.dart';

import '../../../map/map.dart';
import '../../../../util/strings.dart';
import '../../../details/main/screen.dart';

class SearchTabController extends GetxController {
  static const List<String> tabs = ['Hair', 'Nail', 'MakeUp'];
  final MainController _mainController = Get.find();
  var selectedCategory = 0;

  List<Business> _businessesByCategory;
  List<Business> get businessesByCategory => _businessesByCategory;
  List<Business> get businesses => _mainController.businesses;

  SearchTabController() {
    updateBusinessesByCategory(hairCategory);
  }

  updateBusinessesByCategory(String selectedCategory) {
    this.selectedCategory = tabs.indexOf(selectedCategory);
    _businessesByCategory = _mainController.businesses
        .where((i) => i.categories.contains(selectedCategory))
        .toList();
    update();
  }

  goToBusinessDetails(Business business) {
    Get.to(BusinessDetailsScreen(business: business));
  }

  goToMap(Business business) {
    Get.to(MapPage(businessList: businesses));
  }
}
