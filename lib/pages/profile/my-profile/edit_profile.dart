import 'package:flutter/material.dart';
import 'package:systemapp/pages/dashboard/dashboard.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<UserInfo> userInfoList = [
    UserInfo(header: "Personal Information", items: {
      "Full Name": "Steve Maina",
      "DOB": "23/12/1998",
      "Gender": "Male",
      "Email":"stevemaina@gmail.com",
      "Phone": "+254 712 345 678",
      "Marital Status": "Single",
      "Place of Residence": "Rongai",
    }),
    UserInfo(header: "Statutory Info", items: {
      "ID Number": "987654321",
      "Tax Pin": "987654321",
      "NSSF": "987654321",
      "NHIF": "123456789",
      "HELB": "987654321",
    }),
    UserInfo(header: "Next of Kin", 
    items: {
      "Name": "N/A",
      "Address": "987654321",
      "Email": "dummy@gmail.com",
      "Phone": "987654321",
      "Relationship": "Guardian",
    }),
    UserInfo(header: "Famly Details", 
    items: {
      "Name": "123456789",
      "Phone": "987654321",
      "Email": "987654321",
      "No of Children": "987654321",
    },
    ),
  ];

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          // Red clipper at the top
          ClipPath(
            clipper: RedClipper(),
            child: Container(
              color: const Color.fromARGB(255, 126, 167, 255),
              height: 450,
            ),
          ),
          // Black clipper at the bottom right
          Align(
            alignment: Alignment.bottomRight,
            child: ClipPath(
              clipper: BlackClipper(),
              child: Container(
                color: const Color.fromARGB(255, 32, 32, 32),
                height: 400,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          // Main content container
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 20, 20, 20).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // PageView indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(userInfoList.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == index
                              ? const Color.fromARGB(255, 126, 167, 255)
                              : Colors.grey.withOpacity(0.5),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  // PageView.builder inside the container
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: onPageChanged,
                      itemCount: userInfoList.length,
                      itemBuilder: (context, index) {
                        final userInfo = userInfoList[index];
                        return SingleChildScrollView(  // Wrap content in SingleChildScrollView to enable scrolling
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userInfo.header,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              ...userInfo.items.entries.map((entry) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        entry.key,
                                        style: const TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 5),
                                      TextFormField(
                                        initialValue: entry.value,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 16),
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.all(8.0),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 10),
                  
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Homepage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize:const Size(50, 40), // Ensures height is 50
                          backgroundColor: const Color.fromARGB(255, 126, 167, 255), // Background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50), // Rounded corners
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ),
                    const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          if (currentIndex > 0) {
                            _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          if (currentIndex < userInfoList.length - 1) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          }
                        },
                      ),
                      
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom clippers for the red and black design
class RedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height * 0.75); // Bottom left
    path.lineTo(size.width, 0.0); // Top right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BlackClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width * 0.01, size.height); // Bottom left
    path.lineTo(size.width, size.height); // Bottom right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// Model class for user information
class UserInfo {
  final String header;
  final Map<String, String> items;

  UserInfo({required this.header, required this.items});
}
