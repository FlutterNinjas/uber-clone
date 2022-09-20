import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';

class HomeCarousel extends StatefulWidget {
  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  late StreamSubscription<QuerySnapshot> subscription;

  late List<DocumentSnapshot> snapshot;

  CollectionReference snap = FirebaseFirestore.instance.collection("carousel");

  @override
  void initState() {
    subscription = snap.snapshots().listen((datasnap) {
      setState(() {
        snapshot = datasnap.docs;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Carousel(
      boxFit: BoxFit.cover,
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 600),
      dotSize: 6.0,
      dotIncreasedColor: Color(0xff48CAE4),
      dotBgColor: Colors.transparent,
      dotPosition: DotPosition.bottomCenter,
      dotVerticalPadding: 10.0,
      showIndicator: true,
      borderRadius: true,
      indicatorBgPadding: 7.0,
      images: [
        Image.network(snapshot[0].data()!["banner"]),
        Image.network(snapshot[1].data()!["banner"]),
        Image.network(snapshot[2].data()!["banner"]),
        Image.network(snapshot[3].data()!["banner"]),
        Image.network(snapshot[4].data()!["banner"]),
        //Image.network(snapshot[1].data()["two"]),
      ],
    );
  }
}
