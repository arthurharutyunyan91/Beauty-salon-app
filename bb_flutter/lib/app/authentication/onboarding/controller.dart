import 'package:flutter_app/app/home/main/controller.dart';
import 'package:get/get.dart';
import '../../home/main/screen.dart';
import '../sign_in/screen.dart';
import '../sign_up/screen.dart';

class OnBoardingController extends GetxController {
  var index = 0;

  OnBoardingController() {
    _initMainController();
  }

  _initMainController() {
    Get.put(MainController());
  }

  navigateToSignIn() {
    Get.to(SignInScreen());
  }

  navigateToSignUp() {
    Get.to(SignUpScreen());
  }

  navigateToMain() {
    Get.to(MainScreen());
  }

  onPageChange(int index) {
    this.index = index;
    update();
  }
}
