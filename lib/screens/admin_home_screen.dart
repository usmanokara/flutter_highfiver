import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyhive/models/affirmation_model.dart';
import 'package:dailyhive/models/category_model.dart';
import 'package:dailyhive/screens/affirmation_list.dart';
import 'package:dailyhive/screens/profile_screen.dart';
import 'package:dailyhive/screens/user_category_screen.dart';
import 'package:dailyhive/screens/view_users_screen.dart';
import 'package:dailyhive/utils/constants.dart';
import 'package:dailyhive/values/my_images_files.dart';
import 'package:dailyhive/values/myreferences.dart';
import 'package:dailyhive/widgets/dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AdminHomeScreen extends StatefulWidget {
  static const String ID = "/admin_home_screen";

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;

  Future<void> _initDataFromFirebase() async {
    setState(() {
      _isLoading = true;
    });
    try {
      QuerySnapshot categorySnapshot =
          await _firestore.collection("categories").get();
      QuerySnapshot affirmationSnapshot =
          await _firestore.collection("affirmations").get();
      categorySnapshot.docs.forEach((doc) {
        CategoryModel categoryModel = CategoryModel.fromMap(doc.data());
        Constants.categoriesList.add(categoryModel);
      });
      affirmationSnapshot.docs.forEach((doc) {
        AffirmationModel affirmationsList =
            AffirmationModel.fromMap(doc.data());
        Constants.affirmationsList.add(affirmationsList);
      });
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        _isLoading = false;
      });
      AppDialog()
          .showOSDialog(context, "Error", "Something went wrong", "Ok", null);
    }
  }

  @override
  void initState() {
    _initDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Image.asset(
                        MyImages.logo,
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Admin",
                        style: TextStyle(
                            fontFamily: MyReferences.montserratSemiBold,
                            fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      ProfileItems(
                        icon: Icons.check_outlined,
                        title: "Affirmations",
                        onClick: () {
                          Navigator.pushNamed(context, AffimationList.ID,
                              arguments: true);
                        },
                      ),
                      ProfileItems(
                        icon: Icons.category_outlined,
                        title: "Categories ",
                        onClick: () {
                          Navigator.pushNamed(context, UserCategoryScreen.ID,
                              arguments: true);
                        },
                      ),
                      ProfileItems(
                        icon: Icons.person_outline,
                        title: "Users ",
                        onClick: () {
                          Navigator.pushNamed(context, ViewUsersScreen.ID);
                        },
                      ),
                      ProfileItems(
                        icon: Icons.star_border,
                        title: "Rate us",
                        onClick: () {},
                      ),
                      ProfileItems(
                        icon: Icons.share_outlined,
                        title: "Share",
                        onClick: () {},
                      ),
                      ProfileItems(
                        icon: Icons.logout,
                        title: "Logout",
                        onClick: () {},
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }
}
