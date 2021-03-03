import 'package:dailyhive/screens/profile_screen.dart';
import 'package:dailyhive/values/my_images_files.dart';
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
  List<Map<String, dynamic>> list = [
    {
      'text':
          'Two things are infinite:  \nthe universe and human stupidity and I\'m not sure about the universe',
      'author': '-Albert Einstien',
      'image': 'https://wallpaperaccess.com/full/1163661.jpg'
    },
    {
      'text': 'Droplets of water ',
      'author': '-- Newton  --',
      'image':
          'https://cdn.pixabay.com/photo/2017/06/30/22/11/landscape-2459979_1280.jpg'
    },
    {
      'text':
          'Two things are infinite:  \nthe universe and human stupidity and I\'m not sure about the universe',
      'author': '-- Albert Einstien --',
      'image':
          'https://potobutut.files.wordpress.com/2019/07/63810-full-hd-nature-wallpapers-free-downloads-for-laptop-15.jpg'
    },
  ];

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
              contentSize: list.length,
              swipeVelocityThreshold: 2000,
              animationDuration: const Duration(milliseconds: 200),
              // ^ how long the animation will take
              builder: (BuildContext context, int index) {
                return HomeItem(
                  image: list[index]['image'],
                  text: list[index]['text'],
                  author: list[index]['author'],
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
                              imageUrl:
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUNiIFp9GhQQoJ6f_NAGj-77ZvY5gHhH9kUQ&usqp=CAU",
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Good Morning',
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
  HomeItem({this.text, this.image, this.author}) : super();
  String image;
  String text;
  String author;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
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
                          height: 50,
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
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Icon(
                                    FontAwesomeIcons.heart,
                                    color: MyColors.whiteColor,
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
      ),
    );
  }
}
