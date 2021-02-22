import 'package:dailyhive/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AffirmationDetailScreen extends StatefulWidget {
  static String ID = "affirmation_detail_screen";

  @override
  _AffirmationDetailScreenState createState() =>
      _AffirmationDetailScreenState();
}

class _AffirmationDetailScreenState extends State<AffirmationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            HomeItem(
              text:
                  "Two things are infinite:  \nthe universe and human stupidity and I\'m not sure about the universe",
              image:
                  "http://images.unsplash.com/photo-1561016444-14f747499547?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxMjA3fDB8MXxhbGx8fHx8fHx8fA&ixlib=rb-1.2.1&q=80&w=1080",
              author: "-Albert Einstien",
            ),
            Positioned(
                left: 20,
                top: 30,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.40),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
