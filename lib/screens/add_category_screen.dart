import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyhive/models/category_model.dart';
import 'package:dailyhive/screens/profile_screen.dart';
import 'package:dailyhive/utils/constants.dart';
import 'package:dailyhive/values/my_images_files.dart';
import 'package:dailyhive/values/mycolors.dart';
import 'package:dailyhive/widgets/dialogs.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'admin_home_screen.dart';

class AddCategoryScreen extends StatefulWidget {
  static const String ID = "add_category_screen";

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final picker = ImagePicker();
  File file;
  bool _isLoading = false;
  String categoryName = '';

  Future<void> _pickImage(ImageSource imageSource) async {
    PickedFile pickedFile =
        await picker.getImage(source: imageSource, imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        file = File(pickedFile.path);
      });
    }
  }

  Future<String> _uploadProfileImage() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await _firebaseStorage.ref('categories/$categoryName').putFile(file);
      final downloadURL =
          _firebaseStorage.ref('categories/$categoryName').getDownloadURL();
      setState(() {
        _isLoading = false;
      });
      return downloadURL;
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
      return null;
    }
  }

  Future<void> _setCategoryToFirestore() async {
    try {
      if (categoryName == null || categoryName.isEmpty) {
        AppDialog().showOSDialog(
            context, "Required", "Category name is required", "Ok", null);
        return;
      }
      if (file == null) {
        AppDialog().showOSDialog(
            context, "Required", "Please select image", "Ok", null);
        return;
      }
      String id = Constants.getRandomString(15);
      setState(() {
        _isLoading = true;
      });
      String url = await _uploadProfileImage();
      if (url == null) {
        AppDialog()
            .showOSDialog(context, "Error", "Please try again!", "Ok", null);
        setState(() {
          _isLoading = false;
        });
        return;
      }
      CategoryModel categoryModel =
          CategoryModel(id: id, categoryName: categoryName, imageUrl: url);
      await _firestore.doc("categories/$id").set(categoryModel.toMap());
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacementNamed(context, AdminHomeScreen.ID);
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Error: $e");
    }
  }

  _showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Gallery'),
                      onTap: () {
                        _pickImage(ImageSource.gallery);
                        Navigator.pop(context);
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _pickImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: SafeArea(
          child: Column(children: [
            Toolbat(title: "Add Category"),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => _showPicker(),
                    child: ClipRRect(
                        child: file == null
                            ? SvgPicture.asset(
                                MyImages.image,
                                width: double.infinity,
                                height: 200,
                              )
                            : Image.file(
                                file,
                                width: double.infinity,
                                height: 200,
                              )),
                  ),
                  Text(
                    "Category image".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration:
                              InputDecoration(hintText: 'Category name'),
                          onChanged: (value) {
                            setState(() {
                              categoryName = value;
                            });
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: MyColors.orangeColor,
                height: 55,
                child: Text(
                  'ADD',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  _setCategoryToFirestore();
                },
              ),
            ),
            SizedBox(height: 10)
          ]),
        ),
      ),
    );
  }
}
