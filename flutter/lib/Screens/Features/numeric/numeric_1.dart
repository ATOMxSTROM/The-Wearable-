import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class Numeric extends StatefulWidget {
  const Numeric({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NumericState createState() => _NumericState();
}

class _NumericState extends State<Numeric> {
  List<dynamic> users = [];

 // Added variable to hold the selected year

   final  channel =IOWebSocketChannel.connect('ws://10.10.101.207:4000');
  @override
  void initState(){
    super.initState();
    streamListener();
  }
    String btcUsdPrice="0";
    // String XXAx="0";
     String xAxis="0";
     String yAxis="0";
     String zAxis="0";
     String xRotation="0";
     String yRotation="0";
     String zRotation="0";
     String  temperature="0";

  streamListener(){
    print("object");
     channel.stream.listen((message){
      // channel.stream.listen('received!');
      // channel.sink.close(status.goingAway);
     Map getdata = jsonDecode(message);
      
     setState(() {
       
       btcUsdPrice=getdata['x_ax'];
       xAxis=getdata['x_ax'];
      yAxis=getdata['y_ax'];
      zAxis=getdata['z_ax'];
      xRotation=getdata['x_ro'];
      yRotation=getdata['x_ro'];
      zRotation=getdata['x_ro'];
      temperature=getdata['temperature'];
      //  //XXAx=getdata['p'];
     });
     
      
    });
  }







  @override
  Widget build(BuildContext context) {
    // Your existing build method
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Your ListView.builder
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        
                  
                    _buildContainer('Temperature', [
                    _buildAxis('Temperature', temperature),
                  ]),
                 
                  _buildContainer('Accelerometer', [
                    _buildAxis('X',xAxis), // Use selectedYear here
                    _buildAxis('Y',  yAxis),
                    _buildAxis('Z',zAxis),
                     ],
                  ),
                  _buildContainer('Gyroscope', [
                    _buildAxis('X Rotation', xRotation),
                    _buildAxis('Y Rotation', yRotation),
                    _buildAxis('Z Rotation', zRotation),
                  ]),
                
                  const SizedBox(height: 50)
               
                ],
              ),
            )
          ]
        ),
      )
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
            style: const TextStyle(
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

  Widget _buildAxis(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 127, 127, 127),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
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
              value,
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
