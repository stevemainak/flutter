import 'package:flutter/material.dart';
import 'package:systemapp/domain/authentication/login/login.dart';
import 'package:systemapp/pages/claims/claims.dart';
import 'package:systemapp/pages/profile/my-profile/edit_profile.dart';
import 'package:systemapp/pages/profile/my-profile/my-profile.dart';
import 'pages/dashboard/dashboard.dart'; // Import Homepage

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RootPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return const Loginpage(); 
  }
}
