import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uber_clone/models/googleLoginController.dart';
import 'package:uber_clone/models/user.dart';
import 'package:uber_clone/views/EditAccount.dart';

class UserAccount extends StatefulWidget {
  UserAccount({Key? key}) : super(key: key);

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  User? user = FirebaseAuth.instance.currentUser;
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
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 22.0),
                  child: new IconButton(
                    icon: new Icon(Icons.close),
                    onPressed: () => Navigator.pushNamed(context, "/"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      user!.displayName == null
                          ? Text(
                              "Hello,",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )
                          : Text(
                              user!.displayName!,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                      user!.email == null ? Text("") : Text(user!.email!),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, right: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/EditAccount");
                        },
                        child: (user!.photoURL != null)
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(user!.photoURL!),
                                radius: 30,
                              )
                            : Icon(Icons.account_circle),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 1.4, top: 4),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: const [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10.0, top: 4, bottom: 4),
                          child: Icon(Icons.star_rounded, size: 16),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "5.0",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Row(children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 16.0, top: 18.0),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 7.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFFECECEC),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Icon(
                                              CupertinoIcons.doc_fill,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  28,
                                            ),
                                          ),
                                          const Text(
                                            "Help",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, top: 18.0),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 7.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFFECECEC),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Icon(
                                              Icons.account_balance_wallet,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  28,
                                            ),
                                          ),
                                          const Text(
                                            "Wallet",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 18.0),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 7.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFFECECEC),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Icon(
                                              CupertinoIcons.time_solid,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  28,
                                            ),
                                          ),
                                          const Text(
                                            "Trips",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ]),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFECECEC),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Uber Cash",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              '\u{20B9}${0.00}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(
                          height: 4,
                          decoration: BoxDecoration(color: Colors.grey[300])),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child:
                              const Icon(CupertinoIcons.mail_solid, size: 16),
                        ),
                        const Text(
                          "Messages",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: const Icon(CupertinoIcons.gift_fill, size: 16),
                        ),
                        const Text(
                          "Send a gift",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: const Icon(Icons.settings, size: 16),
                        ),
                        const Text(
                          "Settings",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child:
                              const Icon(CupertinoIcons.person_solid, size: 16),
                        ),
                        const Text(
                          "Drive or deliver with Uber",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ]),
                    ),
                    InkWell(
                      onTap: () async {
                        FirebaseService service = new FirebaseService();
                        try {
                          FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushNamed('/login');
                        } catch (e) {
                          if (e is FirebaseAuthException) {
                            showMessage(e.message!);
                          }
                        }
                        try {
                          await service.signOutFromGoogle();
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/login", (route) => false);
                        } catch (e) {
                          if (e is FirebaseAuthException) {
                            showMessage(e.message!);
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Icon(Icons.logout_outlined, size: 16),
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
