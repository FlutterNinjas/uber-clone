import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uber_clone/views/EditAccount.dart';
import 'package:uber_clone/views/GetStarted.dart';
import 'package:uber_clone/views/HomeScreen.dart';
import 'package:uber_clone/views/LoginPage.dart';
import 'package:uber_clone/views/UserAccount.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uber_clone/views/vehicle.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      initialRoute: "/start",
      routes: {
        "/start": (context) => GetStarted(),
        "/login": (context) => LoginPage(),
        "/Home": (context) => HomeScreen(),
        "/Account": (context) => UserAccount(),
        "/EditAccount": (context) => EditAccount(),
        "/vehicle": (context) => vehicle()
        // "/google": (context) => GoogleLogin(),
      },
      title: 'Uber Clone',
      home: HomeScreen(),
      theme: ThemeData(
        fontFamily: 'Rubik',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
