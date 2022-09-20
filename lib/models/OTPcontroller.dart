import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPContoller extends StatefulWidget {
  final String phone;
  final String codeDigits;
  OTPContoller({required this.phone, required this.codeDigits});
  @override
  State<OTPContoller> createState() => _OTPContollerState();
}

class _OTPContollerState extends State<OTPContoller> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPCodeController = TextEditingController();
  final FocusNode _pinOTPCodeFocus = FocusNode();
  String? pinVerificationCode;
  final BoxDecoration pinOTPCodeDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.black,
      ));
  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "${widget.codeDigits + widget.phone}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          if (value.user != null) {
            Navigator.of(context).pushNamed('/Home');
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Invalid OTP"),
          duration: Duration(seconds: 3),
        ));
      },
      codeSent: (String vID, int? resentToken) {
        setState(() {
          pinVerificationCode = vID;
        });
      },
      codeAutoRetrievalTimeout: (String vID) {
        setState(() {
          pinVerificationCode = vID;
        });
      },
      timeout: Duration(seconds: 60),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('OTP Verification'),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text('Enter the OTP if not automatically verified',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child:
                        Text("Verifying: ${widget.codeDigits}-${widget.phone}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(40.0),
                  child: PinPut(
                    fieldsCount: 6,
                    textStyle: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                    eachFieldWidth: 40.0,
                    eachFieldHeight: 55.0,
                    focusNode: _pinOTPCodeFocus,
                    controller: _pinOTPCodeController,
                    submittedFieldDecoration: pinOTPCodeDecoration,
                    selectedFieldDecoration: pinOTPCodeDecoration,
                    followingFieldDecoration: pinOTPCodeDecoration,
                    pinAnimationType: PinAnimationType.rotation,
                    onSubmit: (pin) async {
                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(PhoneAuthProvider.credential(
                                verificationId: pinVerificationCode!,
                                smsCode: pin))
                            .then((value) {
                          if (value.user != null) {
                            Navigator.of(context).pushNamed('/Home');
                          }
                        });
                      } catch (e) {
                        FocusScope.of(context).unfocus();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Invalid OTP"),
                          duration: Duration(seconds: 3),
                        ));
                      }
                    },
                  ))
            ],
          ),
        ));
  }
}
