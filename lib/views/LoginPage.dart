import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/models/OTPcontroller.dart';
import 'package:uber_clone/models/googleLoginController.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String dialCodDigits = "+91";
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void showMessage(String message) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(message),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text("Enter your mobile number",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    width: 120,
                    child: CountryCodePicker(
                      onChanged: (country) {
                        setState(() {
                          dialCodDigits = country.dialCode!;
                        });
                      },
                      initialSelection: "IN",
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      favorite: ["+1", "US", "+91", "IN"],
                    ),
                  ),
                  Container(
                      height: 80,
                      width: 170,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: "Mobile Number",
                            prefix: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(dialCodDigits),
                            )),
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: _controller,
                      )),
                ],
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) => OTPContoller(
                            phone: _controller.text,
                            codeDigits: dialCodDigits,
                          )));
                },
                child: Container(
                    height: 50,
                    color: Colors.black,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 3),
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width / 14),
                            child: Icon(
                              Icons.arrow_forward_sharp,
                              color: Colors.white,
                            ),
                          )
                        ])),
              ),
              SizedBox(height: 24),
              Text(
                "If you continue, you may receive an SMS for verification. Message and datarates may apply.",
                style: TextStyle(
                    color: Colors.grey[600], fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  endIndent: 10,
                  color: Colors.grey,
                  thickness: 1,
                )),
                Text("or",
                    style: TextStyle(
                        color: Colors.grey[600], fontWeight: FontWeight.w600)),
                Expanded(
                    child: Divider(
                  indent: 10,
                  color: Colors.grey,
                  thickness: 1,
                )),
              ]),
              SizedBox(height: 20),
              Container(
                  height: 50,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 32,
                        ),
                        Text(
                          "continue with facebook",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ])),
              SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  FirebaseService service = new FirebaseService();
                  try {
                    await service.signInwithGoogle();
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/Home", (route) => false);
                  } catch (e) {
                    if (e is FirebaseAuthException) {
                      showMessage(e.message!);
                    }
                  }
                },
                child: Container(
                    height: 50,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(
                              'http://pngimg.com/uploads/google/google_PNG19635.png',
                              fit: BoxFit.cover),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Text(
                              "continue with Google",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
