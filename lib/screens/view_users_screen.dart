import 'package:dailyhive/values/myreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewUsersScreen extends StatefulWidget {
  static const String ID = "view_users_screen";
  @override
  _ViewUsersScreenState createState() => _ViewUsersScreenState();
}

class _ViewUsersScreenState extends State<ViewUsersScreen> {
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: UserList(username: "User # $index"),
          ),
        ),
      ),
    );
  }
}

class UserList extends StatelessWidget {
  final String username;
  const UserList({
    Key key,
    this.username,
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
            child: Icon(Icons.person_outline, color: Colors.white),
          ),
          SizedBox(width: 25.0),
          Text(
            this.username,
            style: TextStyle(
              fontFamily: MyReferences.montserratRegular,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
