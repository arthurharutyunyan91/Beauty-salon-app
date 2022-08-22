import 'package:flutter/material.dart';
import 'package:flutter_app/resources/RColors.dart';
import 'package:flutter_app/util/splesh_factory.dart';
import 'package:flutter_app/widget/button/outline_button.dart';

class VerificationPage extends StatefulWidget {
  static const String verificationRoute = '/verification';

  VerificationPage(this.args) : super();

  final VerificationArgs args;

  @override
  State<StatefulWidget> createState() => VerificationPageState();
}

class VerificationPageState extends State<VerificationPage> {
  String verificationId;
  String smsCode;

  @override
  void initState() {
    super.initState();
    // verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: RColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.15,
              right: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.015),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      splashFactory: NoSplashFactory(),
                      primaryColor: Colors.white24),
                  child: TextFormField(
                    cursorWidth: 1.2,
                    cursorColor: Colors.white,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'wrong value';
                      }
                      smsCode = value;
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 44),
                      hintText: 'Sms Code',
                      hintStyle: TextStyle(color: Colors.white24),
                      prefixIcon:
                          Icon(Icons.person_outline, color: Colors.white24),
                      enabledBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white24),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom * 0.65),
                child: OutlineButtonWidget(
                  widgetHeight: MediaQuery.of(context).size.height * 0.065,
                  text: "Sign up",
                  onTap: () {
                    signIn();
                  },
                ),
              ),
            ],
          ),
        ));
  }

  signIn() async {
    // AuthCredential credential = PhoneAuthProvider.getCredential(
    //     verificationId: verificationId, smsCode: smsCode);
    // await FirebaseAuth.instance.signInWithCredential(credential).then((user) {
    //   Navigator.pushNamed(context, "/home");
    //
    //   print('signed in with phone number successful: user -> $user');
    // }).catchError((onError) {
    //   print(onError);
    // });
  }

  // Future<void> verifyPhone() async {
  //   final PhoneVerificationCompleted verificationCompleted =
  //       (AuthCredential credential) {
  //     FirebaseAuth.instance.signInWithCredential(credential).then((authResult) {
  //       Navigator.pushNamed(context, "/home");
  //     });
  //     print("verified");
  //   };

  // final PhoneVerificationFailed verifyFailed = (AuthException exception) {
  //   print("${exception.message}");
  // };

//     final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
//       this.verificationId = verId;
//     };
//
//     final PhoneCodeAutoRetrievalTimeout autoRetrieval = (String verId) {
//       this.verificationId = verId;
//     };
//
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: widget.args.phoneNumber,
//       codeAutoRetrievalTimeout: autoRetrieval,
//       codeSent: smsCodeSent,
//       timeout: const Duration(seconds: 10),
//       verificationCompleted: verificationCompleted,
//       // verificationFailed: verifyFailed
//     );
//   }
}

class VerificationArgs {
  String phoneNumber;
  String name;
  String mail;
  String password;

  VerificationArgs(this.phoneNumber, this.name, this.mail, this.password);
}
