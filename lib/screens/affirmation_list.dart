import 'package:dailyhive/utils/constants.dart';
import 'package:dailyhive/values/myreferences.dart';
import 'package:flutter/material.dart';
import '../screens/add_affirmation_screen.dart';
import '../screens/affirmation_detail_screen.dart';
import '../screens/profile_screen.dart';
import '../utils/affimation_list_tem.dart';
import '../values/mycolors.dart';

class AffimationList extends StatefulWidget {
  static const String ID = "/affirmation_list";

  @override
  _AffimationListState createState() => _AffimationListState();
}

class _AffimationListState extends State<AffimationList> {
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
            Toolbat(title: "Affirmation"),
            Expanded(
                child: Constants.affirmationsList.isEmpty
                    ? Center(
                        child: Text(
                        "No Affirmations",
                        style: TextStyle(
                            fontFamily: MyReferences.montserratSemiBold,
                            fontSize: 25.0),
                      ))
                    : SingleChildScrollView(
                        child: Column(
                          children: Constants.affirmationsList.map((e) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AffirmationDetailScreen.ID);
                              },
                              child: AffirmationListItem(
                                title: e.authorName,
                                backImage: e.imageUrl,
                              ),
                            );
                          }).toList(),
                        ),
                      ))
          ],
        ),
      ),
      floatingActionButton: isAdmin
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AddAffirmationScreen.ID);
              },
              backgroundColor: MyColors.orangeColor,
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}
