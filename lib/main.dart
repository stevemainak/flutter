import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:systemapp/domain/authentication/login/login.dart';
import 'package:systemapp/environments.dart';
import 'package:systemapp/pages/claims/claims.dart';
import 'package:systemapp/pages/leave/handoverRequest.dart';
import 'package:systemapp/pages/leave/leaves.dart';
import 'package:systemapp/pages/leave/yearatglance.dart';
import 'package:systemapp/pages/profile/my-profile/edit_profile.dart';
import 'package:systemapp/pages/profile/my-profile/my-profile.dart';
import 'pages/dashboard/dashboard.dart'; // Import Homepage


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);

  runApp(const ProviderScope(child: MyApp()));

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
