import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../models/user_model.dart';
import 'admin_category_screen.dart';
import 'home_screen.dart';
import 'login_with_admin.dart';
import '../utils/constants.dart';
import '../values/my_images_files.dart';
import '../values/mycolors.dart';
import '../values/myreferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  static const String ID = 'Login Screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
      final User currentUser = _auth.currentUser;

      if (currentUser != null) {
        await _checkUserExists();
        Navigator.pushReplacementNamed(context, HomeScreen.id);
        setState(() {
          _isLoading = false;
        });
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Error: $e");
    }
  }

  Future<void> _checkUserExists() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      DocumentSnapshot snapshot =
          await firestore.doc("users/${Constants.currentUser.uid}").get();
      if (snapshot.exists) {
        Constants.currentUser = UserModel.fromJson(snapshot.data());
        return;
      }
      await firestore
          .doc("users/${Constants.currentUser.uid}")
          .set(Constants.currentUser.toJson());
      Constants.currentUser = UserModel(
          displayName: _auth.currentUser.displayName,
          email: _auth.currentUser.email,
          photoUrl: _auth.currentUser.photoURL,
          uid: _auth.currentUser.uid);
    } on FirebaseException catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(MyImages.LOGIN_BACK)),
        ),
        child: ModalProgressHUD(
          inAsyncCall: _isLoading,
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
                          _signInWithGoogle();
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
      ),
    );
  }
}
