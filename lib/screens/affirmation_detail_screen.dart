import 'package:dailyhive/models/affirmation_model.dart';
import 'package:dailyhive/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AffirmationDetailScreen extends StatefulWidget {
  static const String ID = "affirmation_detail_screen";

  @override
  _AffirmationDetailScreenState createState() =>
      _AffirmationDetailScreenState();
}

class _AffirmationDetailScreenState extends State<AffirmationDetailScreen> {
  AffirmationModel affirmationModel;

  @override
  void didChangeDependencies() {
    affirmationModel = ModalRoute.of(context).settings.arguments;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            HomeItem(
              text: affirmationModel.affirmation,
              image: affirmationModel.imageUrl,
              author: "-${affirmationModel.authorName}",
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
