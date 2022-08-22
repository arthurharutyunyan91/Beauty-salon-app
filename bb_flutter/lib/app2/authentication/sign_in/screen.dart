import 'package:flutter/material.dart';
import 'package:flutter_app/resources/RColors.dart';
import 'package:flutter_app/widget/button/outline_button.dart';
import 'package:flutter_app/widget/text/clickable_underline_text.dart';
import 'package:flutter_app/widget/text/text_input_field.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart' as validator;
import '../../../widget/curve_path/curve_path.dart';
import 'controller.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SignInController());
    return Scaffold(
      backgroundColor: RColors.backgroundColor,
      body: ListView(
        children: <Widget>[
          CurvePathsWithText(
            text: 'Sign in',
          ),
          SizedBox(height: 100),
          _SignInForm(
            onSignIn: controller.signIn,
            onForgetPassword: controller.changePassword,
          ),
        ],
      ),
    );
  }
}

class _SignInForm extends StatelessWidget {
  final Function() onSignIn;
  final Function() onForgetPassword;
  final SignInController controller = Get.find();

  _SignInForm({this.onSignIn, this.onForgetPassword});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 64),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: <Widget>[
            TextInputField(
              inputType: TextInputType.emailAddress,
              controller: controller.emailController,
              validator: (value) {
                if (!validator.isEmail(value)) {
                  return 'wrong email';
                }
                return null;
              },
              style: TextStyle(color: Colors.white),
              hint: 'Email',
              prefixIcon: Icon(Icons.mail_outline),
            ),
            SizedBox(height: 8),
            TextInputField(
              obscureText: controller.obscured,
              controller: controller.passwordController,
              validator: (value) {
                if (value.length < 6) {
                  return 'wrong password';
                }
                return null;
              },
              style: TextStyle(color: Colors.white),
              hint: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
            ),
            SizedBox(height: 50),
            OutlineButtonWidget(
              text: "Sign in",
              widgetHeight: 50,
              onTap: onSignIn,
            ),
            SizedBox(height: 16),
            ClickableUnderlineTextWidget(
              text: 'Forget Password',
              onTap: onForgetPassword,
            ),
          ],
        ),
      ),
    );
  }
}
