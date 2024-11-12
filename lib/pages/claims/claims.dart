// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class ClaimsPage extends StatefulWidget {

  const ClaimsPage({super.key});

  

  @override
  State<ClaimsPage> createState() => _ClaimsPageState();
}

class _ClaimsPageState extends State<ClaimsPage> {
  List<Map<String, String>> claims = [
  {
    'description': 'Medical reimbursement',
    'amount': '15,000',
    'date': '10/01/2024',
    'status': 'Approved',
  },
  {
    'description': 'Travel expenses',
    'amount': '5,000',
    'date': '10/15/2024',
    'status': 'Pending',
  },
  {
    'description': 'Office supplies',
    'amount': '1,200',
    'date': '10/20/2024',
    'status': 'Approved',
  },
  {
    'description': 'Client meeting refreshments',
    'amount': '3,500',
    'date': '10/22/2024',
    'status': 'Rejected',
  },
  {
    'description': 'Team building expenses',
    'amount': '10,000',
    'date': '10/25/2024',
    'status': 'Pending',
  },
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 126, 167, 255),
        title: const Text('Claims',  style: TextStyle(fontSize: 20, color: Colors.white)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showRequestModal(context),
        child: const Icon(Icons.add),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              const Color.fromARGB(255, 126, 167, 255)!,
              const Color.fromARGB(255, 126, 167, 255),
              const Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 85, 85, 85).withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              height: 120,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildColoredCard('Annual', '120000', Colors.blue),
                    buildColoredCard('Monthly', '10000', Colors.green),
                    buildColoredCard('Previous', '0', Colors.red),
                    buildColoredCard('Current', '0', Colors.orange),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Data Table Section with Status and Popup Menu
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 238, 238, 238),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    
                    width: double.infinity,
                    
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'My Claims',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 126, 167, 255),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                              itemCount: claims.length,
                              itemBuilder: (context, index) {
                                return buildClaimCard(
                                  claims[index]['description'] ?? '',
                                  claims[index]['amount'] ?? '',
                                  claims[index]['date'] ?? '',
                                  claims[index]['status'] ?? '',
                                );
                              },
                            ),

                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildClaimCard(String description, String amount, String date, String status) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      amount,
                      style: const TextStyle(color: Colors.black54),
                    ),
                    Text(
                      date,
                      style: const TextStyle(color: Colors.black54),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                        color: status == 'Approved'
                            ? Colors.green
                            : status == 'Rejected'
                                ? Colors.red
                                : Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle Edit, View, Delete actions here
            },
            itemBuilder: (BuildContext context) {
              return {'Edit', 'View', 'Delete'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            icon: const Icon(Icons.more_vert, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget buildColoredCard(String title, String value, Color color) {
    return Container(
      height: 70,
      width: 75,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showRequestModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Request Claim',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 126, 167, 255),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Fill the form to make a finance claim',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            buildTextField('Date of Claim', Icons.calendar_today),
            const SizedBox(height: 10),
            buildDropdownField('Claimant - Staff, spouse or children'),
            const SizedBox(height: 10),
            buildTextField('Total Claimed', Icons.attach_money),
            const SizedBox(height: 10),
            buildUploadField(),
            const SizedBox(height: 10),
            buildDescriptionField(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Apply Claim'),
            ),
          ],
        ),
      );
    },
  );
}

Widget buildTextField(String label, IconData icon) {
  return TextField(
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Widget buildDropdownField(String hint) {
  return DropdownButtonFormField(
    items: const [
      DropdownMenuItem(child: Text('Staff'), value: 'Staff'),
      DropdownMenuItem(child: Text('Spouse'), value: 'Spouse'),
      DropdownMenuItem(child: Text('Children'), value: 'Children'),
    ],
    onChanged: (value) {},
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Widget buildUploadField() {
  return Row(
    children: [
      ElevatedButton(
        onPressed: () {},
        child: const Text('Browse'),
      ),
      const SizedBox(width: 10),
      const Expanded(
        child: Text(
          'No file selected.',
          style: TextStyle(fontSize: 14),
        ),
      ),
    ],
  );
}

Widget buildDescriptionField() {
  return TextField(
    maxLines: 4,
    decoration: InputDecoration(
      labelText: 'Description (*required)',
      alignLabelWithHint: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
