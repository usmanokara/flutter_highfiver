import 'package:dailyhive/screens/add_category_screen.dart';
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
  List<Map<String, dynamic>> categories = [
    {
      'title': 'Lack of self-esteem',
      'image':
          'https://beinspiredchannel.com/wp-content/uploads/2017/05/DO-YOU-LACK-SELF-ESTEEM-HOW-TO-OVERCOME-IT-AND-BECOME-MORE.jpg'
    },
    {
      'title': 'Negativity',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk1ma3iIKO2hvtK_oiGW8Mj61zL3UgwbX75w&usqp=CAU'
    },
    {
      'title': 'Pessimism',
      'image':
          'https://images.theweek.com/sites/default/files/styles/tw_image_9_4/public/iStock-495586361.png?itok=HxKQRniN&resize=450x200'
    },
    {
      'title': 'Self-Pity',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKmzX8QT4CG-xTf12hRw-vEI8BQ9AIVaOb3w&usqp=CAU'
    },
    {
      'title': 'Cynicism',
      'image':
          'https://www.wikihow.com/images/thumb/6/6e/Be-a-Cynic-Step-1-Version-2.jpg/v4-460px-Be-a-Cynic-Step-1-Version-2.jpg'
    },
    {
      'title': 'Depression',
      'image':
          'http://www.mydr.com.au/wp-content/uploads/2018/10/what_is_depression.jpeg'
    },
  ];
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Wrap(
                  children: Constants.categoriesList.map((e) {
                    return GestureDetector(
                      onTap: () {
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
