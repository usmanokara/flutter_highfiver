import 'package:dailyhive/screens/add_category_screen.dart';
import 'package:dailyhive/screens/affirmation_detail_screen.dart';
import 'package:dailyhive/screens/affirmation_list.dart';
import 'package:dailyhive/screens/profile_screen.dart';
import 'package:dailyhive/utils/constants.dart';
import 'package:dailyhive/utils/my_list_card.dart';
import 'package:dailyhive/values/my_images_files.dart';
import 'package:dailyhive/values/mycolors.dart';
import 'package:dailyhive/values/myreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCategoryScreen extends StatefulWidget {
  static const String ID = "user_category_screen";

  @override
  _UserCategoryScreenState createState() => _UserCategoryScreenState();
}

class _UserCategoryScreenState extends State<UserCategoryScreen> {
  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    isAdmin = ModalRoute.of(context).settings.arguments ?? false;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Toolbat(
            title: "Category",
          ),
          Expanded(
            child: Constants.categoriesList.isEmpty
                ? Center(
                    child: Text(
                    "No Category",
                    style: TextStyle(
                        fontFamily: MyReferences.montserratSemiBold,
                        fontSize: 25.0),
                  ))
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: Wrap(
                        children: Constants.categoriesList.map((e) {
                          return GestureDetector(
                            onTap: () {
                              AffimationList.categoryId = e.id;
                              setState(() {});
                              Navigator.pushNamed(context, AffimationList.ID);
                            },
                            child: MyListTile(
                                backImage: e.imageUrl, title: e.categoryName),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
          ),
        ],
      )),
      floatingActionButton: isAdmin
          ? FloatingActionButton(
              backgroundColor: MyColors.orangeColor,
              onPressed: () {
                Navigator.pushNamed(context, AddCategoryScreen.ID);
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}
