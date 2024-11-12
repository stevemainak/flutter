import 'package:flutter/material.dart';
import 'package:systemapp/pages/leave/handoverRequest.dart';
import 'package:systemapp/pages/leave/yearatglance.dart';

class LeavesPage extends StatefulWidget {
  const LeavesPage({super.key});

  @override
  State<LeavesPage> createState() => _LeavesPageState();
}

class _LeavesPageState extends State<LeavesPage> {
  // Dummy leave data
  final List<Map<String, String>> leaveData = [
    {
      "description": "Suffering from malaria...",
      "type": "Sick Leave",
      "date": "10/23/2024",
      "status": "Approved",
    },
    {
      "description": "Annual family vacation...",
      "type": "Annual Leave",
      "date": "09/12/2024",
      "status": "Pending",
    },
    {
      "description": "Research study in progress...",
      "type": "Study Leave",
      "date": "11/01/2024",
      "status": "Approved",
    },
    {
      "description": "Recovery period post-surgery...",
      "type": "Sick Leave",
      "date": "08/30/2024",
      "status": "Rejected",
    },
    {
      "description": "Maternity leave for delivery...",
      "type": "Maternity Leave",
      "date": "07/15/2024",
      "status": "Approved",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 126, 167, 255),
        title: const Text('Leaves', style: TextStyle(fontSize: 20, color: Colors.white)),
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
            const SizedBox(height: 5),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 85, 85, 85).withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildColoredCard('Annual', '3.5 Days', Colors.blue),
                    buildColoredCard('Maternity', '90 Days', Colors.green),
                    buildColoredCard('Study', '7 Days', Colors.red),
                    buildColoredCard('Sick', '7 Days', Colors.orange),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
                Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const HandoverRequest(),
                                      ),
                                    );
                                  },
                                  child: const Text('Handover Request'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const viewleavesPage(),
                                      ),
                                    );
                                  },
                                  child: const Text('Year at Glance'),
                                ),
                              ],
                            ),
                          ),
                      const SizedBox(height: 10),    
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
                  padding: const EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'My Leaves',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 79, 176, 255),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemCount: leaveData.length,
                            itemBuilder: (context, index) {
                              var data = leaveData[index];
                              return buildClaimCard(
                                data['description']!,
                                data['type']!,
                                data['date']!,
                                data['status']!,
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
          ],
        ),
      ),
    );
  }

  Widget buildClaimCard(String description, String type, String date, String status) {
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
                      type,
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
      height: 60,
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
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showRequestModal(BuildContext context) {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();

  Future<void> selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      controller.text = _picked.toString().split(" ")[0];
    }
  }

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Make Leave Request',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Fill the form to apply for leave',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 21, 29, 36),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              buildDropdownField('Type of Leave *'),
              const SizedBox(height: 10),
              buildDropdownField2('Staff to Handover Duties'),
              const SizedBox(height: 10),
              buildDescriptionField2(),
              const SizedBox(height: 10),
              buildDescriptionField(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: buildDatePicker(context, _startDateController, 'Start Date', selectDate),
                  ),
                  const SizedBox(width: 10), 
                  Expanded(
                    child: buildDatePicker(context, _endDateController, 'End Date', selectDate),
                  ),
                ],
              ),
              const SizedBox(height: 20),
        
              ElevatedButton(
                onPressed: () {},
                child: const Text('Apply Leave'),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget buildDatePicker(
  BuildContext context, TextEditingController controller, String label,
  Future<void> Function(BuildContext, TextEditingController) selectDate) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      filled: true,
      prefix: const Icon(Icons.calendar_today),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 44, 3, 83)),
      ),
    ),
    readOnly: true,
    onTap: () => selectDate(context, controller),
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
      DropdownMenuItem(child: Text('Annual'), value: 'Annual'),
      DropdownMenuItem(child: Text('Sick Leave'), value: 'Sick Leave'),
      DropdownMenuItem(child: Text('Study Leave'), value: 'Study Leave'),
      DropdownMenuItem(child: Text('Compassionate'), value: 'Compassionate'),
      DropdownMenuItem(child: Text('Maternity'), value: 'Maternity'),
      DropdownMenuItem(child: Text('Hourly'), value: 'Hourly'),
    ],
    onChanged: (value) {},
    decoration:   
    InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),                                                                                                                                                      
      ),
    ),
  );
}
Widget buildDropdownField2(String hint) {
  return DropdownButtonFormField(
    items: const [
      DropdownMenuItem(child: Text('Employee name'), value: 'Employee'),
      
    ],
    onChanged: (value) {},
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),                                                                                                                                                      
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

Widget buildDescriptionField2() {
  return TextField(
    maxLines: 4,
    decoration: InputDecoration(
      labelText: 'Duties handed Over (*required)',
      alignLabelWithHint: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
Widget buildDescriptionField() {
  return TextField(
    maxLines: 4,
    decoration: InputDecoration(
      labelText: 'Leave Description (*required)',
      alignLabelWithHint: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
