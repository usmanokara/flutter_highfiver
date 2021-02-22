import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'loading_progress.dart';


class AppCacheImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final Widget imageFailWidget;
  final double round;
  final bool showNative;
  final double opacity;
  final Function onTap;
  final double marginHorizontal;
  final double marginVertical;
  final bool showSpinKit;

  AppCacheImage(
      {@required this.imageUrl,
      @required this.width,
      @required this.height,
      this.round,
      this.imageFailWidget,
      this.showNative,
      this.onTap,
      this.marginHorizontal,
      this.marginVertical,
      this.showSpinKit = false,
      this.opacity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: this.marginHorizontal ?? 0,
            vertical: this.marginVertical ?? 0),
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(this.round ?? 0),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(opacity ?? 0.15),
                spreadRadius: 0,
                blurRadius: 5,
                offset: Offset(0, 7), // changes position of shadow
              ),
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(this.round ?? 0),
          child: CachedNetworkImage(
            //memCacheWidth: width.toInt(),
            //memCacheHeight: height.toInt(),
            width: width,
            height: height,
            fit: BoxFit.cover,
            imageUrl: imageUrl ?? "",
            placeholder: (context, url) => Container(
                width: height,
                height: height,
                child:  NativeProgress(
                        showNative: this.showNative ?? false,
                      )),
            errorWidget: (context, url, error) => imageFailWidget == null
                ? Icon(Icons.image, size: 0.80 * width.toDouble())
                : imageFailWidget,
          ),
        ),
      ),
    );
  }
}
