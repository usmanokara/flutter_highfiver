import 'package:dailyhive/models/affirmation_model.dart';
import 'package:dailyhive/screens/profile_screen.dart';
import 'package:dailyhive/utils/affimation_list_tem.dart';
import 'package:dailyhive/utils/constants.dart';
import 'package:dailyhive/values/myreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'affirmation_detail_screen.dart';

class FavoritesAffirmationList extends StatefulWidget {
  static const String ID = "favourites_affirmation";

  @override
  _FavoritesAffirmationListState createState() =>
      _FavoritesAffirmationListState();
}

class _FavoritesAffirmationListState extends State<FavoritesAffirmationList> {
  List<AffirmationModel> affirmationModelList = [];

  void initFavourites() {
    Constants.affirmationsList.forEach((affirmationModel) {
      if (affirmationModel.userIDs.contains(Constants.currentUser.uid)) {
        affirmationModelList.add(affirmationModel);
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    initFavourites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Toolbat(title: "Favourites"),
            Expanded(
                child: affirmationModelList.isEmpty
                    ? Center(
                        child: Text(
                        "No Favourites",
                        style: TextStyle(
                            fontFamily: MyReferences.montserratSemiBold,
                            fontSize: 25.0),
                      ))
                    : SingleChildScrollView(
                        child: Column(
                          children: affirmationModelList.map((e) {
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
    );
  }
}
