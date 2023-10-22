import 'package:ebook/Screens/homeScreen.dart';
import 'package:ebook/Screens/onboardingscreen.dart';
import 'package:ebook/staticData.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? sharedPreferences;
  bool isfirst = true;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isfirst = sharedPreferences!.getBool("isfirst")!;
    StaticData.userid = sharedPreferences!.getString("name")!;
    StaticData.username = sharedPreferences!.getString('username')!;
    if (isfirst == null) {
      setState(() {
        isfirst = true;
      });
    } else {
      setState(() {
        isfirst = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isfirst == false ? HomeScreens() : OnboardingScreen(),
    );
  }
}
