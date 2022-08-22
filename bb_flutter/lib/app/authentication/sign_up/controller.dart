import 'package:flutter/cupertino.dart';
import 'package:flutter_app/app/home/main/screen.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  _navigateToHomePage() {
    Get.to(MainScreen());
  }

  signUp() async {
    if (formKey.currentState.validate()) {
      _navigateToHomePage();
    }
  }

  changePassword() {
    //TODO change password
  }
}
