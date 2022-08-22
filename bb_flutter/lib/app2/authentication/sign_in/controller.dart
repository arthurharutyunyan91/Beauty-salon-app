import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../home/main/screen.dart';

class SignInController extends GetxController {
  var obscured = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _navigateToHomePage() {
    Get.to(MainScreen());
  }

  changeObscuredState() {
    obscured = !obscured;
    update();
  }

  signIn() async {
    //TODO sign in
    if (formKey.currentState.validate()) {
      //   await FireBaseAuthManager.getInstance()
      //       .signIn(emailController.text, passwordController.text)
      //       .catchError(
      //           (err) => Get.snackbar('Error', 'Wrong Email or Password'));
      _navigateToHomePage();
    }
  }

  changePassword() {
    //TODO change password
  }
}
