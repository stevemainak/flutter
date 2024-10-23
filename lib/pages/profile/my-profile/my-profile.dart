import 'package:flutter/material.dart';
import 'package:systemapp/widgets/widgets.dart';
import 'edit_profile.dart';

class UserInfo {
  final String header;
  final Map<String, String> items;

  UserInfo({required this.header, required this.items});
}

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final PageController _pageController = PageController();
  final userInfoList = [
    UserInfo(header: "Personal Info", 
    items: {
      "Full Name": "Steve Maina",
      "DOB": "23/12/1998",
      "Gender": "Male",
      "Email":"stevemaina@gmail.com",
      "Phone": "+254 712 345 678",
      "MArital Status": "SIngle",
      "Place of Residence": "Rongai",


    }),
    UserInfo(header: "Statutory Declaration", 
    items: {
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
    })
    
  ];

  void _previousPage() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _nextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                width: 120,
                height: 120,
                child: CircleAvatar(
                  radius: 50, 
                  backgroundImage: NetworkImage('https://picsum.photos/200/300'),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Steve Maina',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text(
                'stevemaina@gmail.com',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(220, 56, 55, 55)),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const EditProfile(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(235, 37, 37, 37),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: _previousPage,
                    icon: const Icon(Icons.arrow_back),
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  IconButton(
                    onPressed: _nextPage,
                    icon: const Icon(Icons.arrow_forward),
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),

              // PageView with Controller
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 730,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: userInfoList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 173, 26, 16).withOpacity(0.9),
                          borderRadius: BorderRadius.circular(15),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: const Color.fromARGB(255, 184, 184, 184).withOpacity(0.8),
                          //     blurRadius: 5,
                          //     offset: const Offset(0, 4),
                          //   ),
                          // ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userInfoList[index].header,
                              style: const TextStyle(
                                  fontSize: 20,color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            ...userInfoList[index].items.entries.map((entry) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      entry.key,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(255, 255, 228, 228),
                                          fontWeight: FontWeight.w600),
                                          
                                    ),
                                    const SizedBox(height: 5),
                                    TextFormField(
                                      initialValue: entry.value,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(8.0),
                                        filled: true,
                                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(255, 61, 61, 61),
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
              ),

              // Page Navigation Buttons
              
            ],
          ),
        ),
      ),
    );
  }
}
