import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uber_clone/views/HomeScreen.dart';

class vehicle extends StatefulWidget {
  const vehicle({Key? key}) : super(key: key);

  @override
  _vehicleState createState() => _vehicleState();
}

class _vehicleState extends State<vehicle> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            // decoration: BoxDecoration(color: Colors.grey[200]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: IconButton(
                        icon: Icon(CupertinoIcons.arrow_left),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        "https://www.uber-assets.com/image/upload/f_auto,q_auto:eco,c_fill,w_956,h_537/v1569012661/assets/19/dea9bc-88d6-461e-a233-17ed4d8cdc09/original/Taxi.png",
                        height: 50,
                      ),
                      Text("Auto",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      Text("\u{20B9}295-\u{20B9}325",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Container(
                    height: 1,
                    decoration: BoxDecoration(color: Colors.grey[300]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        "https://www.uber-assets.com/image/upload/f_auto,q_auto:eco,c_fill,w_956,h_537/v1569015390/assets/fa/0e26a9-9d9d-4190-ad6d-a879ccef4266/original/Select.png",
                        height: 50,
                      ),
                      Text("Mini",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      Text("\u{20B9}295-\u{20B9}325",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Container(
                    height: 1,
                    decoration: BoxDecoration(color: Colors.grey[300]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Container(
                    height: 1,
                    decoration: BoxDecoration(color: Colors.grey[300]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        "https://www.uber-assets.com/image/upload/f_auto,q_auto:eco,c_fill,w_896,h_504/f_auto,q_auto/products/carousel/UberXL.png",
                        height: 50,
                      ),
                      Text("Prime Sedan",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      Text("\u{20B9}295-\u{20B9}325",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: Text(
                          "Book Any",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
