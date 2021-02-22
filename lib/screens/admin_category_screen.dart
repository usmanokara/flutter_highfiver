import 'package:dailyhive/utils/my_list_card.dart';
import 'package:dailyhive/values/my_images_files.dart';
import 'package:dailyhive/values/mycolors.dart';
import 'package:dailyhive/values/myreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminCategoryScreen extends StatefulWidget {
  static const String id = 'category_screen';

  @override
  _AdminCategoryScreenState createState() => _AdminCategoryScreenState();
}

class _AdminCategoryScreenState extends State<AdminCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Icon(Icons.arrow_back_ios_outlined),
                  ),
                ),
                Center(
                  child: Text(
                    'Categories',
                    style: TextStyle(
                        fontFamily: MyReferences.montserratSemiBold,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: IndexedStack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  MyListTile(
                                    backImage: MyImages.LOGIN_BACK,
                                    title: 'Category Name',
                                  ),
                                  MyListTile(
                                    backImage: MyImages.LOGIN_BACK,
                                    title: 'Category Name',
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  MyListTile(
                                    backImage: MyImages.LOGIN_BACK,
                                    title: 'Category Name',
                                  ),
                                  MyListTile(
                                    backImage: MyImages.LOGIN_BACK,
                                    title: 'Category Name',
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  MyListTile(
                                    backImage: MyImages.LOGIN_BACK,
                                    title: 'Category Name',
                                  ),
                                  MyListTile(
                                    backImage: MyImages.LOGIN_BACK,
                                    title: 'Category Name',
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  MyListTile(
                                    backImage: MyImages.LOGIN_BACK,
                                    title: 'Category Name',
                                  ),
                                  MyListTile(
                                    backImage: MyImages.LOGIN_BACK,
                                    title: 'Category Name',
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MaterialButton(
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              minWidth: double.infinity,
              color: MyColors.orangeColor,
              child: Text(
                'Continue',
                style: TextStyle(
                    color: MyColors.whiteColor,
                    fontSize: 14,
                    fontFamily: MyReferences.montserratRegular),
              ),
              onPressed: () {},
            ),
          ],
        ),
      )),
    );
  }
}
