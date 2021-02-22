import 'package:dailyhive/screens/admin_category_screen.dart';
import 'package:dailyhive/screens/affirmation_list.dart';
import 'package:dailyhive/screens/profile_screen.dart';
import 'package:dailyhive/screens/user_category_screen.dart';
import 'package:dailyhive/values/my_images_files.dart';
import 'package:dailyhive/values/myreferences.dart';
import 'package:dailyhive/widgets/cache_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'favourites_affirmation_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  static String ID = "/admin_home_screen";

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        Navigator.pushNamed(
                            context, AffimationList.ID,arguments: true);
                      },
                    ),
                    ProfileItems(
                      icon: Icons.category_outlined,
                      title: "Categories ",
                      onClick: () {
                        Navigator.pushNamed(context, UserCategoryScreen.ID,arguments: true);
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
    );
  }
}
