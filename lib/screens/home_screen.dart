import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyhive/screens/profile_screen.dart';
import 'package:dailyhive/utils/constants.dart';
import 'package:dailyhive/values/mycolors.dart';
import 'package:dailyhive/values/myreferences.dart';
import 'package:dailyhive/widgets/cache_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'homeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isLiked = false;

  Future<void> _addToFavourites(String id, List fav) async {
    print("Affirmation Id: $id");
    await firestore.doc("affirmations/$id").update({
      "userIDs": fav,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.topCenter,
          children: [
            TikTokStyleFullPageScroller(
              contentSize: Constants.affirmationsList.length,
              swipeVelocityThreshold: 2000,
              animationDuration: const Duration(milliseconds: 200),
              // ^ how long the animation will take
              builder: (BuildContext context, int index) {
                return HomeItem(
                  image: Constants.affirmationsList[index].imageUrl,
                  text: Constants.affirmationsList[index].affirmation,
                  author: Constants.affirmationsList[index].authorName,
                  isLiked: Constants.affirmationsList[index].userIDs
                      .contains(Constants.currentUser.uid),
                  onLike: () {
                    List userIds = [];
                    userIds = Constants.affirmationsList[index].userIDs;
                    if (userIds.contains(Constants.currentUser.uid)) {
                      setState(() {
                        Constants.affirmationsList[index].userIDs
                            .remove(Constants.currentUser.uid);
                      });
                    } else {
                      setState(() {
                        Constants.affirmationsList[index].userIDs
                            .add(Constants.currentUser.uid);
                      });
                    }
                    _addToFavourites(Constants.affirmationsList[index].id,
                        Constants.affirmationsList[index].userIDs);
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, ProfileScreen.id);
                            },
                            child: AppCacheImage(
                              height: 40,
                              width: 40,
                              round: 20,
                              imageUrl: Constants.currentUser.photoUrl,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            Constants.currentUser.displayName,
                            style: TextStyle(
                                fontFamily: MyReferences.montserratRegular,
                                color: MyColors.whiteColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: MyColors.whiteColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5)),
                            height: 40,
                            width: 35,
                            child: Icon(
                              Icons.format_list_numbered,
                              color: MyColors.whiteColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeItem extends StatelessWidget {
  HomeItem(
      {this.text, this.image, this.author, this.isLiked = false, this.onLike})
      : super();
  final String image;
  final String text;
  final String author;
  final bool isLiked;
  final Function onLike;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AppCacheImage(
          imageUrl: this.image,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(0.4),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        this.text,
                        style: TextStyle(
                            fontFamily: MyReferences.soji,
                            color: MyColors.whiteColor,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        this.author,
                        style: TextStyle(
                            fontFamily: MyReferences.soji,
                            color: MyColors.whiteColor,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.35),
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Icon(
                                  Icons.share_rounded,
                                  color: MyColors.whiteColor,
                                  size: 30.0,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: GestureDetector(
                                  onTap: this.onLike,
                                  child: isLiked
                                      ? Icon(
                                          FontAwesomeIcons.solidHeart,
                                          color: Colors.red,
                                          size: 30.0,
                                        )
                                      : Icon(
                                          FontAwesomeIcons.heart,
                                          color: MyColors.whiteColor,
                                          size: 30.0,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
