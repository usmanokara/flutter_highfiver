import 'package:dailyhive/screens/add_category_screen.dart';
import 'package:dailyhive/screens/admin_category_screen.dart';
import 'package:dailyhive/screens/admin_home_screen.dart';
import 'package:dailyhive/screens/affirmation_detail_screen.dart';
import 'package:dailyhive/screens/affirmation_list.dart';
import 'package:dailyhive/screens/favourites_affirmation_screen.dart';
import 'package:dailyhive/screens/home_screen.dart';
import 'package:dailyhive/screens/login_screen.dart';
import 'package:dailyhive/screens/login_with_admin.dart';
import 'package:dailyhive/screens/profile_screen.dart';
import 'package:dailyhive/screens/splash_screen.dart';
import 'package:dailyhive/screens/user_category_screen.dart';
import 'package:dailyhive/values/my_images_files.dart';
import 'package:flutter/material.dart';
import 'values/my_images_files.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(MyImages.logo), context);
    precacheImage(AssetImage(MyImages.LOGIN_BACK), context);
    precacheImage(AssetImage(MyImages.HOME_BACK), context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.id: (_) => SplashScreen(),
        LoginScreen.ID: (_) => LoginScreen(),
        AdminCategoryScreen.id: (_) => AdminCategoryScreen(),
        HomeScreen.id: (_) => HomeScreen(),
        ProfileScreen.id: (_) => ProfileScreen(),
        UserCategoryScreen.ID: (_) => UserCategoryScreen(),
        AffimationList.ID: (_) => AffimationList(),
        AffirmationDetailScreen.ID: (_) => AffirmationDetailScreen(),
        FavoritesAffirmationList.ID: (_) => FavoritesAffirmationList(),
        LoginWithEmail.ID: (_) => LoginWithEmail(),
        AdminHomeScreen.ID: (_) => AdminHomeScreen(),
        AddCategoryScreen.ID: (_) => AddCategoryScreen()
      },
      home: SplashScreen(),
    );
  }
}
