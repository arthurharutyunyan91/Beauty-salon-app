import 'package:flutter_app/app/details/main/screen.dart';
import 'package:flutter_app/model/business.dart';
import 'package:get/get.dart';
import '../../main/controller.dart';

class FavoritesTabController extends GetxController {
  final MainController mainController = Get.find();
  var favorites = <Business>[];

  FavoritesTabController() {
    _getFavoritesBusinesses();
  }

  _getFavoritesBusinesses() {
    favorites = mainController.businesses.where((i) => i.favorite).toList();
    update();
  }

  goToBusinessDetails(Business business) {
    Get.to(BusinessDetailsScreen(business: business));
  }
}
