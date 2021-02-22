import 'dart:ui';

import 'package:dailyhive/screens/admin_category_screen.dart';
import 'package:dailyhive/screens/home_screen.dart';
import 'package:dailyhive/screens/login_with_admin.dart';
import 'package:dailyhive/values/my_images_files.dart';
import 'package:dailyhive/values/mycolors.dart';
import 'package:dailyhive/values/myreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  static const String ID = 'Login Screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(MyImages.LOGIN_BACK)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 2,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Image.asset(MyImages.logo),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Welcome to Daily  Hive',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: MyReferences.montserratSemiBold,
                          color: MyColors.whiteColor),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '''Unleash the power of your subconscious mind by starting each day with unique affirmations''',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: MyReferences.montserratRegular,
                          color: MyColors.whiteColor),
                    ),
                  ],
                ),
                Column(
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: MyColors.whiteColor,
                      height: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.google,
                            color: MyColors.orangeColor,
                          ),
                          SizedBox(width: 20),
                          Text('Continue with Google'),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                      },
                    ),
                    SizedBox(height: 15),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: MyColors.whiteColor,
                      height: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 20),
                          Text('Continue with Facebook'),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, AdminCategoryScreen.id);
                      },
                    ),
                    SizedBox(height: 15),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: MyColors.orangeColor,
                      height: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.user,
                            color: Colors.white,
                          ),
                          SizedBox(width: 20),
                          Text(
                            'Login as Admin',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, LoginWithEmail.ID);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
