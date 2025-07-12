import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provista/Screens/Features/time.dart';

class SearchNumeric extends StatefulWidget {
  const SearchNumeric({super.key});

  @override
  _SearchNumericState createState() => _SearchNumericState();
}

class _SearchNumericState extends State<SearchNumeric> {
  List<dynamic> users = [];
   String selectedTime = "00:00:00";
   
    void updateSelectedTime(String time) {
    setState(() {
      selectedTime = time; // Update selected time
    });
    fetchUser(); // Fetch data with new selected time
  } // Time to filter data

  String xAxis = "";
  String yAxis = "";
  String zAxis = "";
  String xRotation = "";
  String yRotation = "";
  String zRotation = "";
  String temp = "";

  void fetchUser() async {
    print("Called");
    final url = "http://10.10.101.207:2000/api/data";
    final response = await http.get(Uri.parse(url));
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json;
      // Filter data based on selected time
      final filteredData = users.where((element) => element["time"] == selectedTime).toList();
      if (filteredData.isNotEmpty) {
        xAxis = filteredData[0]["x_ax"].toString();
        yAxis = filteredData[0]["y_ax"].toString();
        zAxis = filteredData[0]["z_ax"].toString();
        xRotation = filteredData[0]["x_ro"].toString();
        yRotation = filteredData[0]["y_ro"].toString();
        zRotation = filteredData[0]["z_ro"].toString();
        temp = filteredData[0]["temperature"].toString();
      } else {
        // Handle case where no data found for selected time
        print("No data found for selected time");
        xAxis = "N/A";
        yAxis = "N/A";
        zAxis = "N/A";
        xRotation = "N/A";
        yRotation = "N/A";
        zRotation = "N/A";
        temp = "N/A";
      }
    });
    print("Completed");
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            DropDown(
  onTimeSelected: updateSelectedTime, // Pass callback function
),
            const SizedBox(height: 15),
             _buildContainer('Temperature', [
              _buildAxis('Temperature', double.tryParse(temp) ?? 0),
            ]),
            // Removed DropDown widget as it's not required for this functionality
            _buildContainer('Accelerometer', [
              _buildAxis('X', double.tryParse(xAxis) ?? 0),
              _buildAxis('Y', double.tryParse(yAxis) ?? 0),
              _buildAxis('Z', double.tryParse(zAxis) ?? 0),
            ]),
            _buildContainer('Gyroscope', [
              _buildAxis('X Rotation', double.tryParse(xRotation) ?? 0),
              _buildAxis('Y Rotation', double.tryParse(yRotation) ?? 0),
              _buildAxis('Z Rotation', double.tryParse(zRotation) ?? 0),
            ]),
           
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const
 TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildAxis(String title, double value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4), // Reduced bottom margin
      padding: const EdgeInsets.all(8), // Added padding
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 127, 127, 127),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10), // Add this line
      ),
      child: Row(
        children: [
          Text(
            '$title:',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
