import 'package:get/get.dart';

import '../../../../model/business.dart';
import '../../main/controller.dart';

class ReviewTabController extends GetxController {
  final DetailsMainController detailsMainController = Get.find();

  Business get business => detailsMainController.business;

  double averageStars() {
    var totalStars = 0.0;
    business.reviews.forEach((review) => totalStars += review.starsCount);
    return totalStars / business.reviews.length;
  }
}
