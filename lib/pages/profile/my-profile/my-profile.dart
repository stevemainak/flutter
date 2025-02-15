import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:systemapp/providers/providers.dart';
import 'edit_profile.dart';

class UserInfo {
  final String header;
  final Map<String, dynamic> items;

  UserInfo({required this.header, required this.items});
}

class MyProfilePage extends StatefulWidget {
  final String staffid;
  const MyProfilePage({super.key, required this.staffid});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final PageController _pageController = PageController();

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
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
                  color: Color.fromARGB(220, 56, 55, 55),
                ),
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
                      color: Colors.white,
                    ),
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
              Consumer(
                builder: (context, ref, child) {
                  final asyncRes = ref.watch(fetchDetailsProvider(widget.staffid));

                  return asyncRes.when(
                    data: (result) {
                      final profileData = result[0];
                      final error = result[1];

                      if (error != null) {
                        return Center(child: Text(error)); // Display error
                      }

                      if (profileData == null) {
                        return const Center(child: Text('No data available.'));
                      }

                      try {
                        // Parse the data
                        final userInfoList = [
                          UserInfo(
                            header: "Personal Info",
                            items: (profileData['personal_details'] as Map<dynamic, dynamic>)
                                .map((key, value) =>
                                    MapEntry(key.toString(), value?.toString() ?? '')),
                          ),
                          UserInfo(
                            header: "Statutory Declaration",
                            items: (profileData['statutory_declaration'] as Map<dynamic, dynamic>)
                                .map((key, value) =>
                                    MapEntry(key.toString(), value?.toString() ?? '')),
                          ),
                          UserInfo(
                            header: "Next of Kin",
                            items: (profileData['next_of_kin'] as Map<dynamic, dynamic>)
                                .map((key, value) =>
                                    MapEntry(key.toString(), value?.toString() ?? '')),
                          ),
                          UserInfo(
                            header: "Family Details",
                            items: (profileData['family_details'] as Map<dynamic, dynamic>)
                                .map((key, value) =>
                                    MapEntry(key.toString(), value?.toString() ?? '')),
                          ),
                        ];

                        // Display the parsed data in a PageView
                        return SizedBox(
                          height: 730,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: userInfoList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.symmetric(vertical: 8.0),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 126, 167, 255),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userInfoList[index].header,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    ...userInfoList[index].items.entries.map(
                                      (entry) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                entry.key,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              TextFormField(
                                                initialValue: entry.value,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.all(8.0),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(16),
                                                    borderSide: const BorderSide(
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } catch (e) {
                        return Center(child: Text('Error parsing data: $e'));
                      }
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    error: (err, stack) => Center(
                      child: Text('Error: $err'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
