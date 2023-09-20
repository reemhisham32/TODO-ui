import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/Screens/Login/login.dart';
import 'package:todo/SignUp/signup.dart';
import 'package:todo/Themes.dart';
import 'package:todo/HomeLayout/HomeLayout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.disableNetwork();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {

HomeLayout.routes:(context)=>HomeLayout(),
        LoginScreen.routeName:(context)=>LoginScreen(),
        SignUpScreen.routeName:(context)=> SignUpScreen(),

        
      },
      initialRoute:HomeLayout.routes,
      theme: MyTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
