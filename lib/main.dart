import 'package:Angrybaaz/screens/editingScreen.dart';
import 'package:Angrybaaz/screens/homeOverviewScreen.dart';
import 'package:Angrybaaz/screens/itemOverviewScreen.dart';
import 'package:Angrybaaz/screens/loginScreen.dart';
import 'package:Angrybaaz/screens/visitStoreItemTypeScreen.dart';
import 'package:Angrybaaz/widgets/specificTypeCategory.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/unAuthorise.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './screens/passwordResetScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    if (_currentUser == null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          accentColor: Color(0xff382933),
          primaryColor: Color(0xff671B97),
          scaffoldBackgroundColor: Colors.white,
          cursorColor: Color(0xff671B97),
        ),
        home: LoginScreen(),
        routes: {
          HomeOverviewScreen.id: (context) => HomeOverviewScreen(),
          ItemOverviewScreen.id: (context) => ItemOverviewScreen(),
          SpecificTypeCategory.id: (context) => SpecificTypeCategory(),
          VisitStoreItemType.id: (context) => VisitStoreItemType(),
          LoginScreen.id: (context) => LoginScreen(),
          ResetPassword.id: (context) => ResetPassword(),
          // CustomScreen.id: (context) => CustomScreen(),
          // MyHomePage.id: (context) => MyHomePage(),
        },
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        accentColor: Color(0xff382933),
        primaryColor: Color(0xff671B97),
        scaffoldBackgroundColor: Colors.white,
        cursorColor: Color(0xff671B97),
      ),
      home: _currentUser.emailVerified == false
          ? UnAuthoriseUser()
          : HomeOverviewScreen(),
      routes: {
        EditingScreen.id: (context) => EditingScreen(),
        HomeOverviewScreen.id: (context) => HomeOverviewScreen(),
        ItemOverviewScreen.id: (context) => ItemOverviewScreen(),
        SpecificTypeCategory.id: (context) => SpecificTypeCategory(),
        VisitStoreItemType.id: (context) => VisitStoreItemType(),
        LoginScreen.id: (context) => LoginScreen(),
        ResetPassword.id: (context) => ResetPassword(),
        // ItemAddedScreen.id: (context) => ItemAddedScreen(),
      },
    );
  }
}
