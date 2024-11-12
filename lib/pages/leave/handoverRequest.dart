import 'package:flutter/material.dart';

class HandoverRequest extends StatefulWidget {
  const HandoverRequest({super.key});

  @override
  State<HandoverRequest> createState() => _HandoverRequestState();
}

class _HandoverRequestState extends State<HandoverRequest> {
  final List<Map<String, String>> handoverRequests = [
    {'name': 'Eather Akinyi Owino', 'date': '10/23/2024', 'type': 'Hourly'},
    {'name': 'Bruce Mugo', 'date': '10/23/2024', 'type': 'Hourly'},
    {'name': 'Joy Kiragu', 'date': '10/23/2024', 'type': 'Hourly'},
    {'name': 'Terry', 'date': '10/23/2024', 'type': 'Hourly'},
    {'name': 'Steve', 'date': '10/23/2024', 'type': 'Hourly'},
    {'name': 'Steve', 'date': '10/23/2024', 'type': 'Hourly'},
    {'name': 'Steve', 'date': '10/23/2024', 'type': 'Hourly'},
    {'name': 'Steve', 'date': '10/23/2024', 'type': 'Hourly'},
    {'name': 'Steve', 'date': '10/23/2024', 'type': 'Hourly'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Handover Request'),
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
              width: 400,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      
                      
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Handover Requests',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 126, 167, 255),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            
                            child: ListView.builder(
                              itemCount: handoverRequests.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return buildRequestCard(
                                  handoverRequests[index]['name']!,
                                  handoverRequests[index]['date']!,
                                  handoverRequests[index]['type']!,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      
                    ),
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

Widget buildRequestCard(String name, String date, String type) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 238, 238, 238),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //  Accept function
                    },
                    style: ElevatedButton.styleFrom(
                        
                        backgroundColor: const Color.fromARGB(150, 65, 241, 94), // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Rounded corners
                        ),
                        minimumSize: const Size(70, 25),
                      
                    ),
                    child: const Text("Accept", style: TextStyle(fontSize: 13, color: Colors.white),),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      //  Reject function
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 95, 84),
                      
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Rounded corners
                        ),
                        minimumSize: const Size(70, 25),
                    ),
                    child: const Text("Reject", style: TextStyle(fontSize: 13, color: Colors.white),),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                type,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
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