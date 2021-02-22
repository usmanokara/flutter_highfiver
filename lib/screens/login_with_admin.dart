import 'dart:ui';

import 'package:dailyhive/screens/admin_home_screen.dart';
import 'package:dailyhive/screens/profile_screen.dart';
import 'package:dailyhive/values/my_images_files.dart';
import 'package:dailyhive/values/mycolors.dart';
import 'package:dailyhive/values/myreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginWithEmail extends StatefulWidget {
  static String ID = "/admin_login_screen";

  @override
  _LoginWithEmailState createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Toolbat(
                title: "",
              ),
              Image.asset(MyImages.logo, width: 150, height: 150),
              SizedBox(height: 30),
              Text(
                "Admin Login",
                style: TextStyle(
                    color: MyColors.orangeColor,
                    fontSize: 20,
                    fontFamily: MyReferences.montserratSemiBold),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Email'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(hintText: 'password'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: MyColors.orangeColor,
                  height: 55,
                  child: Text(
                    'Login as Admin',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AdminHomeScreen.ID);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
