import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Color(0xff276CF0),
            child: Column(
              children: [
                SizedBox(height: 60),
                Text("Uber",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                Image.asset('assets/images/getStarted.png'),
                SizedBox(height: 30),
                Text("Move with safety",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold)),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 18),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: Container(
                        height: MediaQuery.of(context).size.height / 12,
                        color: Colors.black,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 4),
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right:
                                        MediaQuery.of(context).size.width / 14),
                                child: Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.white,
                                ),
                              )
                            ])),
                  ),
                ),
                SizedBox(height: 40),
              ],
            )));
  }
}
