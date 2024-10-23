// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class ClaimsPage extends StatefulWidget {
  const ClaimsPage({super.key});

  @override
  State<ClaimsPage> createState() => _ClaimsPageState();
}

class _ClaimsPageState extends State<ClaimsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 176, 255), // Matches gradient color
        title: const Text('Claims'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              const Color.fromARGB(255, 40, 176, 255)!,
              const Color.fromARGB(255, 10, 204, 194),
              const Color.fromARGB(255, 76, 168, 255),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 100, // Adjusted height to fit card and text
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6, // Adjust based on number of cards
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: buildCard(),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Colored Cards Section
            Container(
              decoration:  BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius:const BorderRadius.all(Radius.circular(25),),
                  boxShadow: [
                    BoxShadow(
                      color:  const Color.fromARGB(255, 85, 85, 85).withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                      ),
                ],
                  ),
               // padding: const EdgeInsets.only(right: 5.0),
              height: 140,
              width: double.infinity,
              // color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
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
            // Data Table Section
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'My Claims',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView(
                          children: [
                            buildDataTable('10/23/2024', '10,000'),
                            buildDataTable('10/23/2024', '10,000'),
                            buildDataTable('10/23/2024', '10,000'),
                            buildDataTable('10/23/2024', '10,000'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard() {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(100), // Rounded corners
            boxShadow: [
                    BoxShadow(
                      color:  const Color.fromARGB(255, 85, 85, 85).withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                      ),
                ],
          ),
        ),
        const SizedBox(height: 3),
        const Text(
          'Dummy Title\nDummy Subtitle',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

  Widget buildColoredCard(String title, String value, Color color) {
    return Container(
      width: 90,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
                    BoxShadow(
                      color:  const Color.fromARGB(255, 85, 85, 85).withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                      ),
                ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                 fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDataTable(String date, String amount) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(1),
        },
        children: [
          TableRow(
            children: [
              const Text('Date claimed'),
              const Text('Amount Claimed'),
              
              Container(),
            ],
          ),
          
          TableRow(
            children: [
              Text(date),
              Text(amount),
              const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
