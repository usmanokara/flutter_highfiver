import 'package:dailyhive/values/mycolors.dart';
import 'package:dailyhive/values/myreferences.dart';
import 'package:dailyhive/widgets/cache_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AffirmationListItem extends StatelessWidget {
  final String backImage;
  final title;

  AffirmationListItem({this.backImage, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          child: Stack(
            children: [
              AppCacheImage(
                  imageUrl: backImage,
                  width: double.infinity,
                  height: double.infinity),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.35),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                right: 10,
                child: Text(
                  '$title',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: MyColors.whiteColor,
                      fontSize: 14,
                      fontFamily: MyReferences.montserratRegular),
                ),
              ),
            ],
          ),
          height: MediaQuery.of(context).size.height / 4,
          width: double.infinity,
        ),
      ),
    );
  }
}
