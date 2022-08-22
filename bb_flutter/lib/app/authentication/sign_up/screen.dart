import 'package:flutter/material.dart';
import 'package:flutter_app/resources/RColors.dart';
import 'package:flutter_app/widget/button/outline_button.dart';
import 'package:flutter_app/widget/text/text_input_field.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart' as validator;

import '../../../widget/curve_path/curve_path.dart';
import 'controller.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      backgroundColor: RColors.backgroundColor,
      body: ListView(
        children: <Widget>[
          CurvePathsWithText(
            fromLeft: false,
            text: 'Sign up',
          ),
          _SignUpFormWidget(
            onSignUp: controller.signUp,
            onFacebookSignUp: () => Get.snackbar('TODO', 'Facebook'),
            onGoogleSignUp: () => Get.snackbar('TODO', 'Google'),
          ),
        ],
      ),
    );
  }
}

class _SignUpFormWidget extends StatelessWidget {
  final SignUpController controller = Get.find();
  final Function() onSignUp;
  final Function() onGoogleSignUp;
  final Function() onFacebookSignUp;

  _SignUpFormWidget({
    Key key,
    @required this.onSignUp,
    @required this.onGoogleSignUp,
    @required this.onFacebookSignUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 8),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: <Widget>[
            TextInputField(
              controller: controller.emailController,
              inputType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              hint: 'Email',
              prefixIcon: Icon(Icons.mail_outline),
              validator: (value) {
                if (!validator.isEmail(value)) {
                  return 'wrong email';
                }
                return null;
              },
            ),
            SizedBox(height: 8),
            TextInputField(
              controller: controller.passwordController,
              style: TextStyle(color: Colors.white),
              hint: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              validator: (value) {
                if (value.length < 6) {
                  return 'wrong password';
                }
                return null;
              },
            ),
            SizedBox(height: 8),
            TextInputField(
              controller: controller.confirmPasswordController,
              style: TextStyle(color: Colors.white),
              hint: 'Confirm Password',
              prefixIcon: Icon(Icons.lock_outline),
              validator: (value) {
                if (value != controller.confirmPasswordController.text ||
                    value.length < 6) {
                  return 'wrong password';
                }
                return null;
              },
            ),
            SizedBox(height: 8),
            TextInputField(
              controller: controller.nameController,
              style: TextStyle(color: Colors.white),
              hint: 'Name',
              prefixIcon: Icon(Icons.person_outline),
              validator: (value) {
                if (value.isEmpty) {
                  return 'wrong name';
                }
                return null;
              },
            ),
            SizedBox(height: 8),
            TextInputField(
              controller: controller.phoneNumberController,
              inputType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              hint: 'Phone number',
              prefixIcon: Icon(Icons.phone_outlined),
              validator: (value) {
                if (value.length < 9) {
                  return 'wrong number';
                }
                return null;
              },
            ),
            SizedBox(height: 32),
            OutlineButtonWidget(
              widgetHeight: 50,
              text: "Sign up",
              onTap: onSignUp,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Image.asset(
                    'assets/images/G.png',
                  ),
                  color: Colors.white70,
                  iconSize: 50,
                  onPressed: onGoogleSignUp,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/images/F.png',
                  ),
                  color: Colors.white70,
                  iconSize: 50,
                  onPressed: onFacebookSignUp,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
