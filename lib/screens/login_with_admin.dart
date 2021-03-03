import 'package:flutter/material.dart';
import '../widgets/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'admin_home_screen.dart';
import 'profile_screen.dart';
import '../values/my_images_files.dart';
import '../values/mycolors.dart';
import '../values/myreferences.dart';

class LoginWithEmail extends StatefulWidget {
  static const String ID = "/admin_login_screen";

  @override
  _LoginWithEmailState createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  String _email = '';
  String _password = '';
  bool _isLoading = false;

  Function kEmailValidator = (emailValue) {
    if (emailValue.isEmpty) {
      return 'Email cannot be empty';
    }
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);
    if (regExp.hasMatch(emailValue)) {
      return null;
    } else {
      return 'Email Syntax is not Correct';
    }
  };
  Future<void> _loginAdmin() async {
    if (_email == null || _email.isEmpty) {
      AppDialog()
          .showOSDialog(context, "Invalid", "Email is required", "Ok", null);
      return;
    }
    if (_password == null || _password.isEmpty) {
      AppDialog()
          .showOSDialog(context, "Invalid", "Password is required", "Ok", null);
      return;
    }
    if (_password.length < 6) {
      AppDialog().showOSDialog(
          context, "Invalid", "At least 6 character is required", "Ok", null);
      return;
    }
    _signIn();
  }

  Future<void> _signIn() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    setState(() {
      _isLoading = true;
    });
    try {
      await auth.signInWithEmailAndPassword(email: _email, password: _password);
      setState(() {
        _isLoading = false;
      });
      Navigator.pushNamed(context, AdminHomeScreen.ID);
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Auth Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Toolbat(
                  title: "",
                ),
                Image.asset(MyImages.logo, width: 150, height: 150),
                SizedBox(height: 30),
                Text(
                  "Admin Login",
                  style: TextStyle(
                      color: MyColors.orangeColor,
                      fontSize: 20,
                      fontFamily: MyReferences.montserratSemiBold),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: kEmailValidator,
                        decoration: InputDecoration(hintText: 'Email'),
                        onChanged: (email) => _email = email,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(hintText: 'password'),
                        onChanged: (pass) => _password = pass,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: MyColors.orangeColor,
                    height: 55,
                    child: Text(
                      'Login as Admin',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      _loginAdmin();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
