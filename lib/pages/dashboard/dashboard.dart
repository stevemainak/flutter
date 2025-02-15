import 'package:flutter/material.dart';
import 'package:systemapp/pages/claims/claims.dart';
import 'package:systemapp/pages/leave/leaves.dart';
import 'package:systemapp/session_manager.dart';
import 'package:systemapp/widgets/pricePoints.dart';
import 'package:systemapp/widgets/widgets.dart';
import '../../domain/authentication/login/login.dart';
import '../profile/my-profile/my-profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String buttonName = 'click';
  int currentIndex = 0;
  String userName = 'User'; // Default name in case loading is delayed
  String staffId = 'staff_id';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    String? name = await UserSecureStorage.getUserName();
    String? staffId = await UserSecureStorage.getstaffid();
    setState(() {
      userName = name ?? 'User'; // Default to 'User' if name is null
      this.staffId = staffId!;
    });
  }

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(248, 246, 246, 248),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: const Text(
          'DASHBOARD',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[50], 
              radius: 20, 
              child: ClipOval(
                child: Image.asset(
                  'assets/images/images.jpeg', 
                  fit: BoxFit.cover,
                  width: 30, 
                  height: 30,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Logout"),
                  content: const Text("Are you sure you want to logout?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        UserSecureStorage.logout(context);
                      },
                      child: const Text("Logout"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white, 
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.close_rounded, size: 35.0),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the drawer
                        },
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/launcher-icon.png',
                            height: 80,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'JUMUISHA HR',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person_pin),
                title: const Text(
                  'PROFILE',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>  MyProfilePage(staffid: staffId,),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.access_time_filled_sharp),
                title: const Text(
                  'LEAVE',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LeavesPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.playlist_add_check_rounded),
                title: const Text(
                  'CLAIMS',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ClaimsPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.folder_copy_rounded),
                title: const Text(
                  'PERFORMANCE',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Homepage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.comment),
                title: const Text(
                  'COMMENTS',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Homepage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.file_open),
                title: const Text(
                  'DOCUMENTS',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Homepage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child:  Row(
                  children: [
                    Text(
                      'Welcome $userName',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(200, 27, 27, 27),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.waving_hand,
                      color: Colors.amber,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 16.0),
                      child: Text(
                        'My Performance Summary',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(204, 41, 41, 41),
                        ),
                      ),
                    ),
                    Linechart(points: pricePoints),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 0.2,
                mainAxisSpacing: 1,
                children: [
                  Gridbox(
                    boxcolor: const Color.fromARGB(255, 255, 255, 255),
                    text: "Handover Request",
                    subText: "Peer Request",
                    iconDisplay: Icons.description,
                    tColor: const Color.fromARGB(135, 50, 233, 240),
                    sColor: const Color.fromARGB(255, 33, 46, 165),
                  ),
                  Gridbox(
                    text: 'Performance Assessments',
                    subText: 'Assessments Due',
                    iconDisplay: Icons.line_axis_sharp,
                    boxcolor: const Color.fromARGB(255, 255, 255, 255),
                    tColor: const Color.fromARGB(255, 0, 0, 0),
                    sColor: const Color.fromARGB(255, 255, 123, 0),
                  ),
                  Gridbox(
                    text: 'Leaves Approval',
                    subText: 'Staff Request',
                    iconDisplay: Icons.folder_copy_rounded,
                    boxcolor: const Color.fromARGB(255, 255, 255, 255),
                    tColor: const Color.fromARGB(255, 37, 26, 26),
                    sColor: const Color.fromARGB(255, 3, 142, 255),
                  ),
                  Gridbox(
                    text: 'Direct Staff',
                    subText: 'Direct Reporting',
                    iconDisplay: Icons.report,
                    boxcolor: const Color.fromARGB(255, 255, 255, 255),
                    tColor: const Color.fromARGB(255, 37, 26, 26),
                    sColor: const Color.fromARGB(255, 255, 153, 0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'HOME',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'SETTINGS',
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(
            label: 'PERSON',
            icon: Icon(Icons.person_2_rounded),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index; // Update currentIndex when tapped
          });
        },
      ),
    );
  }
}
