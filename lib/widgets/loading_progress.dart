import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NativeProgress extends StatelessWidget {
  bool showNative;

  NativeProgress({this.showNative});

  @override
  Widget build(BuildContext context) {
    return Platform?.isAndroid?? true
        ? this.showNative
            ? CircularProgressIndicator()
            : CupertinoActivityIndicator()
        : Theme(
            data: ThemeData(
                cupertinoOverrideTheme: CupertinoThemeData(
                    brightness: Brightness.light,
                    primaryColor: Colors.white,
                    barBackgroundColor: Colors.white)),
            child: CupertinoActivityIndicator());
  }
}
