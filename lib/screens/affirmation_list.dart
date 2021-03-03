import 'package:dailyhive/models/affirmation_model.dart';
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
  static String categoryId;

  @override
  _AffimationListState createState() => _AffimationListState();
}

class _AffimationListState extends State<AffimationList> {
  bool isAdmin = false;
  List<AffirmationModel> affirmationList = [];

  void _initData() {
    print("Cat id: ${AffimationList.categoryId}");
    if (AffimationList.categoryId != null) {
      affirmationList = Constants.affirmationsList
          .where((element) => element.categoryId == AffimationList.categoryId)
          .toList();
      setState(() {});
      return;
    }

    affirmationList = Constants.affirmationsList;
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    isAdmin = ModalRoute.of(context).settings.arguments ?? false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Toolbat(title: "Affirmation"),
            Expanded(
                child: affirmationList.isEmpty
                    ? Center(
                        child: Text(
                        "No Affirmations",
                        style: TextStyle(
                            fontFamily: MyReferences.montserratSemiBold,
                            fontSize: 25.0),
                      ))
                    : SingleChildScrollView(
                        child: Column(
                          children: affirmationList.map((e) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AffirmationDetailScreen.ID,
                                    arguments: e);
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
