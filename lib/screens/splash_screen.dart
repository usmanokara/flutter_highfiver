import 'dart:async';
import 'dart:ui';

import 'package:dailyhive/screens/login_screen.dart';
import 'package:dailyhive/values/my_images_files.dart';
import 'package:dailyhive/values/mycolors.dart';
import 'package:dailyhive/values/myreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash Screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context)
          .pushNamedAndRemoveUntil(LoginScreen.ID, (route) => false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.width / 2,
                width: MediaQuery.of(context).size.width / 2,
                child: Image.asset(MyImages.logo),
              ),
              SizedBox(height: 20,),
              Text(
                'Daily Hive\nFive',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 60,
                    fontFamily: MyReferences.alexBrush,
                    color: MyColors.orangeColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
