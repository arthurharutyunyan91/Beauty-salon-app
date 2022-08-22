import 'package:flutter/material.dart';

class PhoneSignInWidget extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (_) => PhoneSignInWidget());
  @override
  State<StatefulWidget> createState() => PhoneSignInWidgetState();
}

class PhoneSignInWidgetState extends State<PhoneSignInWidget> {
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController codeNumController = TextEditingController();

  String _smsVerificationCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(
          top: 100,
          left: MediaQuery.of(context).size.width * 0.15,
          right: MediaQuery.of(context).size.width * 0.15,
          bottom: MediaQuery.of(context).size.height * 0.06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: phoneNumController,
            decoration: InputDecoration(
                labelText: "Phone Number", border: OutlineInputBorder()),
          ),
          FlatButton(
            child: Text("Send code"),
            onPressed: () => _verifyPhoneNumber(context),
          ),
          TextFormField(
            controller: codeNumController,
            decoration: InputDecoration(
                labelText: "Verification Code", border: OutlineInputBorder()),
          ),
          FlatButton(
            child: Text("Confirm Code"),
            // onPressed: () => {signInWithPhoneNumber()},
          ), //FlatButton
        ], // Widget
      ),
    ));
  }

  // void signInWithPhoneNumber() {
  //   var credintal = PhoneAuthProvider.getCredential(
  //       verificationId: _smsVerificationCode,
  //       smsCode: codeNumController.text.toString());
  //   FirebaseAuth.instance.signInWithCredential(credintal);
  // }

  _verifyPhoneNumber(BuildContext context) async {
    String phoneNumber = phoneNumController.text.toString();
    // final FirebaseAuth _auth = FirebaseAuth.instance;
    // await _auth.verifyPhoneNumber(
    //     phoneNumber: phoneNumber,
    //     timeout: Duration(seconds: 5),
    //     verificationCompleted: (authCredential) =>
    //         _verificationComplete(authCredential, context),
    //     // verificationFailed: (authException) =>
    //     // _verificationFailed(authException, context),
    //     codeAutoRetrievalTimeout: (verificationId) =>
    //         _codeAutoRetrievalTimeout(verificationId),
    //     // called when the SMS code is sent
    //     codeSent: (verificationId, [code]) =>
    //         _smsCodeSent(verificationId, [code]));
  }

  // _verificationComplete(AuthCredential authCredential, BuildContext context) {
  //   FirebaseAuth.instance
  //       .signInWithCredential(authCredential)
  //       .then((authResult) {
  //     final snackBar =
  //         SnackBar(content: Text("Success!!! UUID is: " + authResult.user.uid));
  //     Scaffold.of(context).showSnackBar(snackBar);
  //   });
  // }

  _smsCodeSent(String verificationId, List<int> code) {
    // set the verification code so that we can use it to log the user in
    _smsVerificationCode = verificationId;
  }

  // _verificationFailed(AuthException authException, BuildContext context) {
  //   final snackBar = SnackBar(
  //       content:
  //       Text("Exception!! message:" + authException.message.toString()));
  //   Scaffold.of(context).showSnackBar(snackBar);
}

_codeAutoRetrievalTimeout(String verificationId) {
  // set the verification code so that we can use it to log the user in
  // _smsVerificationCode = verificationId;
  // }
}
