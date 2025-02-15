import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:systemapp/models/login_credentials.dart';
import 'package:systemapp/models/user_credentials.dart';
import 'package:systemapp/pages/dashboard/dashboard.dart';
import 'package:systemapp/providers/providers.dart';
import 'package:systemapp/session_manager.dart';
import 'package:tuple/tuple.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
    emailController.addListener(_validateFields);
    passwordController.addListener(_validateFields);
  }

  Future<void> _checkLoginStatus() async {
    if (await UserSecureStorage.isLoggedIn()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    }
  }

  void _validateFields() {
    setState(() {
      isButtonEnabled =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Remove the Toast method
  // void  _showErrorToast(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     backgroundColor: Colors.red,
  //     textColor: Colors.white,
  //     fontSize: 16.0,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              const Color.fromARGB(255, 126, 167, 255)!,
              const Color.fromARGB(255, 126, 167, 255)!,
              const Color.fromARGB(255, 126, 167, 255)!,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/jumuishalogo.png', 
                    height: 80,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: <Widget>[
                    const SizedBox(height: 60),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(148, 48, 48, 48),
                                blurRadius: 10,
                                offset: Offset(0, 1))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                color: Colors.grey.shade200,
                              )),
                            ),
                            child: TextField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                color: Colors.grey.shade200,
                              )),
                            ),
                            child: TextField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                border: InputBorder.none,
                              ),
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 40),
                    Consumer(
                      builder: (_, WidgetRef ref, __) {
                        return ElevatedButton(
                         onPressed: isButtonEnabled
                        ? () async {
                            // Fetch the response
                            var response = await ref.read(
                              loginUserProvider(Tuple2(
                                emailController.text,
                                passwordController.text,
                              )).future,
                            );

                            

                            // Check if response contains a valid token or a 403 error
                           if (response[0] != null && response[1] == 200) {
  // Parse the login response and store credentials
                            final jsonResponse = json.decode(response[0]!);
                            LoginCredentials credentials = LoginCredentials.fromJson(jsonResponse);
                            

                            // Store user information in secure storage
                            await UserSecureStorage.setUserid(credentials.id.toString());
                            await UserSecureStorage.setUserName(credentials.personalInfo.fullName);
                            await UserSecureStorage.setUserEmail(credentials.email);
                            await UserSecureStorage.setUserRoleId(credentials.roleId.toString());
                            await UserSecureStorage.setstaffid(credentials.personalInfo.staffId);
                            await UserSecureStorage.setAccessToken(credentials.tokens.access);
                            await UserSecureStorage.setRefreshToken(credentials.tokens.refresh);
                            await UserSecureStorage.setUserRole(credentials.role);  
                            await UserSecureStorage.setPhoneNumber(credentials.personalInfo.phoneNumber); 

                            // Navigate to Dashboard
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Homepage(),
                              ),
                            );
                            } else {
                              // Show error SnackBar on invalid credentials or 403 error
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    response[1] == 403
                                        ? 'Invalid email or password'
                                        : 'An unexpected error occurred',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        : null,

                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: const Color.fromARGB(255, 126, 167, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      "Continue with social media",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 40,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue),
                            child: const Center(
                              child: Text(
                                "Facebook",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 40,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.black),
                            child: const Center(
                              child: Text(
                                "Google",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
