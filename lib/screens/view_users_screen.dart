import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyhive/models/user_model.dart';
import 'package:dailyhive/values/myreferences.dart';
import 'package:dailyhive/widgets/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ViewUsersScreen extends StatefulWidget {
  static const String ID = "view_users_screen";
  @override
  _ViewUsersScreenState createState() => _ViewUsersScreenState();
}

class _ViewUsersScreenState extends State<ViewUsersScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<UserModel> userModelList = [];
  bool _isLoading = false;

  Future<void> _getUsers() async {
    setState(() {
      _isLoading = true;
    });
    QuerySnapshot snapshot = await _firestore.collection("users").get();
    snapshot.docs.forEach((doc) {
      UserModel userModel = UserModel.fromJson(doc.data());
      userModelList.add(userModel);
    });
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _getUsers();
    super.initState();
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
          "Users",
          style: TextStyle(
            fontFamily: MyReferences.montserratSemiBold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: userModelList.isEmpty
              ? Center(
                  child: Text(
                  _isLoading ? "" : "No Users",
                  style: TextStyle(
                      fontFamily: MyReferences.montserratSemiBold,
                      fontSize: 25.0),
                ))
              : ListView.builder(
                  itemCount: userModelList.length,
                  itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: UserList(
                      username: "${userModelList[index].displayName}",
                      imageUrl: userModelList[index].photoUrl,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class UserList extends StatelessWidget {
  final String username;
  final String imageUrl;
  const UserList({
    Key key,
    this.username,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 7.0,
            offset: Offset(0, 1),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: this.imageUrl != null
                ? AppCacheImage(
                    imageUrl: this.imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    round: 30,
                  )
                : Icon(Icons.person_outline, color: Colors.white),
          ),
          SizedBox(width: 25.0),
          Flexible(
            child: Text(
              this.username,
              style: TextStyle(
                fontFamily: MyReferences.montserratRegular,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
