import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyhive/models/affirmation_model.dart';
import 'package:dailyhive/models/category_model.dart';
import 'package:dailyhive/utils/constants.dart';
import 'package:dailyhive/values/mycolors.dart';
import 'package:dailyhive/widgets/dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../values/myreferences.dart';
import 'admin_home_screen.dart';

class AddAffirmationScreen extends StatefulWidget {
  static const String ID = "add_affirmation_screen";
  @override
  _AddAffirmationScreenState createState() => _AddAffirmationScreenState();
}

class _AddAffirmationScreenState extends State<AddAffirmationScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CategoryModel _categoryModel;
  String categoryName;
  String authorName = "";
  String affirmation = "";
  bool _isLoading = false;

  Future<void> _setAffirmationToFirestore() async {
    if (categoryName == null || categoryName.isEmpty) {
      AppDialog()
          .showOSDialog(context, "Required", "Select a category", "Ok", null);
      return;
    }
    if (authorName == null || authorName.isEmpty) {
      AppDialog().showOSDialog(
          context, "Required", "Author name is required", "Ok", null);
      return;
    }
    if (authorName.length < 3) {
      AppDialog().showOSDialog(context, "Required",
          "Author name should be greater than 2", "Ok", null);
      return;
    }

    if (affirmation == null || affirmation.isEmpty) {
      AppDialog().showOSDialog(
          context, "Required", "Affirmation is required", "Ok", null);
      return;
    }
    if (affirmation.length < 8) {
      AppDialog().showOSDialog(context, "Required",
          "Affirmation must contains more than 7 characters", "Ok", null);
      return;
    }
    setState(() {
      _isLoading = true;
    });
    String id = Constants.getRandomString(15);
    AffirmationModel affirmationModel = AffirmationModel(
      id: id,
      category: _categoryModel,
      affirmation: affirmation,
      authorName: authorName,
    );
    try {
      await _firestore.doc("affirmations/$id").set(affirmationModel.toMap());
      Navigator.pushReplacementNamed(context, AdminHomeScreen.ID);
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        _isLoading = false;
      });
      AppDialog()
          .showOSDialog(context, "Error", "Something went wrong", "Ok", null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Add Affirmation",
          style: TextStyle(
            fontFamily: MyReferences.montserratSemiBold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.0),
                  Text(
                    'Choose Category',
                    style: TextStyle(
                      fontFamily: MyReferences.montserratSemiBold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  DropdownButtonFormField(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    isExpanded: true,
                    hint: Text(
                      categoryName ?? 'Category Name',
                      style: TextStyle(
                        fontFamily: MyReferences.montserratRegular,
                        color: categoryName != null
                            ? Colors.black
                            : Colors.black.withOpacity(0.6),
                      ),
                    ),
                    items: Constants.categoriesList.map((category) {
                      return new DropdownMenuItem<String>(
                        value: category.categoryName,
                        onTap: () {
                          _categoryModel = category;
                        },
                        child: new Text(
                          category.categoryName,
                          style: TextStyle(
                            fontFamily: MyReferences.montserratRegular,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      setState(() {
                        categoryName = value;
                      });
                    },
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'Author Name',
                    style: TextStyle(
                      fontFamily: MyReferences.montserratSemiBold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 7,
                          offset: Offset(0, 6), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      cursorColor: Colors.black,
                      onChanged: (value) {
                        authorName = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Type Author Name",
                        hintStyle: TextStyle(
                            fontFamily: MyReferences.montserratRegular,
                            color: Colors.black.withOpacity(0.4)),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'Add Afﬁrmation',
                    style: TextStyle(
                      fontFamily: MyReferences.montserratSemiBold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 7,
                          offset: Offset(0, 6), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 8,
                      cursorColor: Colors.black,
                      onChanged: (value) {
                        affirmation = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Type Afﬁrmation",
                        hintStyle: TextStyle(
                            fontFamily: MyReferences.montserratRegular,
                            color: Colors.black.withOpacity(0.4)),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0)),
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 60.0),
                  MaterialButton(
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 60.0,
                    onPressed: () {
                      _setAffirmationToFirestore();
                    },
                    color: MyColors.orangeColor,
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontFamily: MyReferences.montserratSemiBold,
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: 5.0,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
