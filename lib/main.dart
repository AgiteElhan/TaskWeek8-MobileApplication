import 'package:flutter/material.dart';
import 'package:pert_8/screens/login_page.dart';
import 'package:pert_8/screens/home_page.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Agit',
      initialRoute: '/',

      routes: {
        '/': (context)=> LoginPage(),
        '/home' :(context)=> HomePage()
      },
    );
  }
}