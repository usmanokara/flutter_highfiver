import 'package:firebase_core/firebase_core.dart';

import 'screens/view_users_screen.dart';
import 'package:flutter/material.dart';
import 'screens/add_affirmation_screen.dart';
import 'screens/add_category_screen.dart';
import 'screens/admin_category_screen.dart';
import 'screens/admin_home_screen.dart';
import 'screens/affirmation_detail_screen.dart';
import 'screens/affirmation_list.dart';
import 'screens/favourites_affirmation_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/login_with_admin.dart';
import 'screens/profile_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/user_category_screen.dart';
import 'values/my_images_files.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        AddCategoryScreen.ID: (_) => AddCategoryScreen(),
        AddAffirmationScreen.ID: (_) => AddAffirmationScreen(),
        ViewUsersScreen.ID: (_) => ViewUsersScreen(),
      },
      home: SplashScreen(),
    );
  }
}
