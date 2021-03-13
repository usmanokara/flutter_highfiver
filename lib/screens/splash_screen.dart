import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyhive/models/affirmation_model.dart';
import 'package:dailyhive/models/category_model.dart';
import 'package:dailyhive/models/user_model.dart';
import 'package:dailyhive/screens/admin_home_screen.dart';
import 'package:dailyhive/screens/home_screen.dart';
import 'package:dailyhive/screens/login_screen.dart';
import 'package:dailyhive/utils/constants.dart';
import 'package:dailyhive/values/my_images_files.dart';
import 'package:dailyhive/values/mycolors.dart';
import 'package:dailyhive/values/myreferences.dart';
import 'package:dailyhive/widgets/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash Screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _checkUserAlreadyLoggedIn() async {
    if (_auth.currentUser == null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(LoginScreen.ID, (route) => false);
      return;
    }
    if (_auth.currentUser.email == Constants.Admin) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AdminHomeScreen.ID, (route) => false);
      return;
    }
    await _initDataFromFirebase();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(HomeScreen.id, (route) => false);
  }

  Future<void> _initDataFromFirebase() async {
    try {
      DocumentSnapshot userSnapshot =
          await _firestore.doc("users/${_auth.currentUser.uid}").get();
      QuerySnapshot categorySnapshot =
          await _firestore.collection("categories").get();
      QuerySnapshot affirmationSnapshot =
          await _firestore.collection("affirmations").get();
      Constants.currentUser = UserModel.fromJson(userSnapshot.data());
      categorySnapshot.docs.forEach((doc) {
        CategoryModel categoryModel = CategoryModel.fromMap(doc.data());
        Constants.categoriesList.add(categoryModel);
      });
      affirmationSnapshot.docs.forEach((doc) {
        AffirmationModel affirmationsList =
            AffirmationModel.fromMap(doc.data());
        Constants.affirmationsList.add(affirmationsList);
      });
    } catch (e) {
      AppDialog()
          .showOSDialog(context, "Error", "Something went wrong", "Ok", null);
      print("Error: $e");
    }
  }

  @override
  void initState() {
    Timer(
      Duration(seconds: 1),
      () => _checkUserAlreadyLoggedIn(),
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
              SizedBox(
                height: 20,
              ),
              Text(
                'Daily Hive\nFive',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 50,
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
