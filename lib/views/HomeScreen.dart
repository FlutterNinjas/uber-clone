import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uber_clone/views/map.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Container(
                child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/Account");
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: (user!.photoURL != null)
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(user!.photoURL!),
                                radius: 30,
                              )
                            : Icon(Icons.account_circle),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xFFE2DDF1),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0, top: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ready? Then let's roll.",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Icon(Icons.arrow_forward))
                                ],
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/images/start.jfif',
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width / 3.5,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height / 5,
                      // color: Colors.grey,
                      child: Row(children: [
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFECECEC),
                                  ),
                                  child: Image.asset(
                                    "assets/images/ride.png",
                                    height:
                                        MediaQuery.of(context).size.height / 9,
                                  ),
                                ),
                              ),
                              Text(
                                "Ride",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFECECEC),
                                  ),
                                  child: Image.asset(
                                    "assets/images/package.png",
                                    height:
                                        MediaQuery.of(context).size.height / 9,
                                  ),
                                ),
                              ),
                              Text(
                                "Package",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFECECEC),
                                  ),
                                  child: Image.asset(
                                    "assets/images/rental.png",
                                    height:
                                        MediaQuery.of(context).size.height / 9,
                                  ),
                                ),
                              ),
                              Text(
                                "Reserve",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFECECEC),
                                  ),
                                  child: Container(
                                    child: Center(
                                      child: Icon(
                                        Icons.more_horiz,
                                        size:
                                            MediaQuery.of(context).size.height /
                                                18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "More",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        ),
                      ])),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MapView()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFEDEDED),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Where to?",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.access_time_filled),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Text(
                                          "Now",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Icon(Icons.arrow_drop_down)
                                    ]),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xFFEDEDED)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.star_rounded, size: 20),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  "Choose a saved place",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.arrow_forward_ios, size: 16)),
                        ]),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 50,
                          left: MediaQuery.of(context).size.width / 7),
                      child: Container(
                          decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 26),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Color(0xFFEDEDED)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.pin_drop, size: 20),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    "Set destination on map",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.arrow_forward_ios, size: 16)),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 50,
                          left: MediaQuery.of(context).size.width / 7),
                      child: Container(
                          decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      )),
                    )
                  ]),
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
