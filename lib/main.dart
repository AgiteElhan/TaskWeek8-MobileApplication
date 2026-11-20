import 'package:flutter/material.dart';
import 'package:pert_8/screens/login_page.dart';
import 'package:pert_8/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        // '/': (context)=> LoginPage(),
        // '/home' :(context)=> HomePage()
      },
    );
  }
}