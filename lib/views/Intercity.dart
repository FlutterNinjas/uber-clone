import 'package:flutter/material.dart';
import 'package:uber_clone/views/map.dart';

class InterCity extends StatelessWidget {
  const InterCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Image.asset('assets/images/Intercity.jpg'),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text("Uber Intercity",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.add_location_rounded, size: 26),
              ),
              Flexible(
                  child: Text(
                      "For outstation trips to Pune, Lonavala, Alibaug and more",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold))),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.payments_sharp, size: 26),
              ),
              Flexible(
                  child: Text("Convenient and affordable rides",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold))),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.event_available, size: 26),
              ),
              Flexible(
                  child: Text("Available anywhere, anytime",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold))),
            ],
          ),
        ),
        SizedBox(height: 150),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 18),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MapView()));
            },
            child: Container(
                height: MediaQuery.of(context).size.height / 12,
                color: Colors.black,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 4),
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
                            right: MediaQuery.of(context).size.width / 14),
                        child: Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.white,
                        ),
                      )
                    ])),
          ),
        ),
      ],
    ));
  }
}
