import 'package:flutter/material.dart';
import 'package:systemapp/pages/dashboard/dashboard.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
      
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            const Color.fromARGB(255, 0, 0, 0)!,
            const Color.fromARGB(255, 85, 6, 6)!,
            const Color.fromARGB(255, 82, 3, 3)!,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space between the texts and logo
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
          // Insert the logo next to the texts
          Image.asset(
            'images/usalama_logo_red_large.png', // Ensure the asset path is correct
            height: 80, // Adjust the size to fit well with the texts
          ),
        ],
),

              
            ),
            const SizedBox(height: 20,),
            Expanded(child: Container(
              decoration:const BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60),)
              ),
              child: Padding(
                padding:const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 60,),
                    Container(
                      padding:const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:const [BoxShadow(
                          color: Color.fromARGB(148, 48, 48, 48),
                          blurRadius: 10,
                          offset: Offset(0, 1)
                        )]
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding:const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(
                                color: Colors.grey.shade200,
                              )),
                            ),
                            child:const TextField(
                              decoration: InputDecoration(
                                hintText: "Email or Phone Number",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            padding:const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(
                                color: Colors.grey.shade200,
                              )),
                            ),
                            child:const TextField(
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40,),
                    const Text("Forgot Password?", style: TextStyle(color: Colors.grey),),
                    const SizedBox(height: 40,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Homepage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize:const Size(double.infinity, 50), // Ensures height is 50
                        backgroundColor: const Color.fromARGB(226, 150, 0, 0), // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Rounded corners
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
                    ),
                    const SizedBox(height: 50,),
                    
                         const Text("Continue with social media", style: TextStyle(color: Colors.grey),),
                        const SizedBox(height: 30,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 40,
                            margin:const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.blue
                            ),
                            child:const Center(
                              child: Text("Facebook", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                      ),
                          ),
                        ),

                        Expanded(
                          child: Container(
                            height: 40,
                            margin:const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black
                            ),
                            child:const Center(
                              child: Text("GIthub", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                      ),
                          ),
                        ),
                      ],
                    )
                  ]
                    

                    ),
                ),
                
             ),
            ),
          ],
        ),
      ),
     );
  }
}