import 'dart:io';
import 'dart:ui';

import 'package:dailyhive/screens/profile_screen.dart';
import 'package:dailyhive/values/my_images_files.dart';
import 'package:dailyhive/values/mycolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'admin_home_screen.dart';

class AddCategoryScreen extends StatefulWidget {
  static String ID = "add_category_screen";

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Toolbat(title: "Add Category"),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                    child: file == null
                        ? SvgPicture.asset(
                            MyImages.image,
                            width: double.infinity,
                            height: 200,
                          )
                        : Image.file(
                            file,
                            width: double.infinity,
                            height: 200,
                          )),
                Text(
                  "Category image".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
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
                        decoration: InputDecoration(hintText: 'Add category'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: MyColors.orangeColor,
              height: 55,
              child: Text(
                'ADD',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.pushNamed(context, AdminHomeScreen.ID);
              },
            ),
          ),
          SizedBox(height: 10)
        ]),
      ),
    );
  }
}
