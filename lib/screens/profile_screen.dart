import 'package:dailyhive/screens/favourites_affirmation_screen.dart';
import 'package:dailyhive/screens/user_category_screen.dart';
import 'package:dailyhive/utils/constants.dart';
import 'package:dailyhive/values/myreferences.dart';
import 'package:dailyhive/widgets/cache_image.dart';
import 'package:dailyhive/widgets/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profileScreen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _logOut() {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginScreen.ID, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Toolbat(title: "Profile"),
                    SizedBox(height: 20),
                    AppCacheImage(
                      height: 100,
                      width: 100,
                      round: 50,
                      imageUrl: Constants.currentUser.photoUrl,
                    ),
                    SizedBox(height: 10),
                    Text(
                      Constants.currentUser.displayName,
                      style: TextStyle(
                          fontFamily: MyReferences.montserratSemiBold,
                          fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    ProfileItems(
                      icon: Icons.person_outline,
                      title: "Update profile",
                      onClick: () {},
                    ),
                    ProfileItems(
                      icon: Icons.favorite_border,
                      title: "Favoirites",
                      onClick: () {
                        Navigator.pushNamed(
                            context, FavoritesAffirmationList.ID);
                      },
                    ),
                    ProfileItems(
                      icon: Icons.category_outlined,
                      title: "Categories ",
                      onClick: () {
                        Navigator.pushNamed(context, UserCategoryScreen.ID);
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
                      onClick: () {
                        AppDialog().showOSDialog(
                          context,
                          "Are you sure?",
                          "Do you really want to logout?",
                          "No",
                          () {},
                          secondButtonText: "Yes",
                          secondCallback: () {
                            _logOut();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ))),
    );
  }
}

class ProfileItems extends StatelessWidget {
  ProfileItems({this.title, this.onClick, this.icon});

  String title;
  Function onClick;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClick,
      leading: Container(
        height: 40,
        width: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xFFE6E6E6)),
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontFamily: MyReferences.montserratRegular,
            fontWeight: FontWeight.w500,
            fontSize: 20),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}

class Toolbat extends StatelessWidget {
  Toolbat({this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: MyReferences.montserratSemiBold,
                      fontSize: 20),
                ),
              ),
            ),
            Opacity(
              opacity: 0,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
