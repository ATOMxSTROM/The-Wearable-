// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'dart:async';
// import 'dart:math' as math;
// import 'package:web_socket_channel/io.dart';

// class Chart extends StatefulWidget {
//   Chart({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   _ChartState createState() => _ChartState();
// }

// class _ChartState extends State<Chart> {
//   String Temperature = "26";
//   String timing = "0";
//   String seconds = "0";
//   String modifiedTime = "0";

//   List<dynamic> users = [];

//   final channel = IOWebSocketChannel.connect('ws://10.10.101.207:4000');

//   late List<LiveData> chartData;
//   late ChartSeriesController _chartSeriesController;

//   @override
//   void initState() {
//     chartData = getChartData();
//     Timer.periodic(const Duration(seconds: 1), updateDataSource);
//     super.initState();
//     streamListener();
//   }

//   streamListener() {
//     channel.stream.listen((message) {
//       Map getdata = jsonDecode(message);
//       setState(() {
//         String temperature = getdata["temperature"];
//         double? temperatureDouble = double.tryParse(temperature);
//         Temperature = temperatureDouble.toString();
//         String Seconds = getdata["time"];
// // Splitting the time string by ":" and accessing the last element for seconds
//         String modified = Seconds.split(":").last;

//         print("Original Time: $Seconds");
//         print(modified);

//         modifiedTime=modified;

//         print(Temperature);
//         print(Seconds);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             SfCartesianChart(
//               series: <SplineSeries<LiveData, int>>[
//                 SplineSeries<LiveData, int>(
//                     onRendererCreated: (ChartSeriesController controller) {
//                       _chartSeriesController = controller;
//                     },
//                     dataSource: chartData,
//                     color: const Color.fromRGBO(192, 108, 132, 1),
//                     xValueMapper: (LiveData data, _) => data.time,
//                     yValueMapper: (LiveData data, _) => data.temperature),
//                 SplineSeries<LiveData, int>(
//                     dataSource: chartData,
//                     color: const Color.fromRGBO(192, 108, 132, 1),
//                     xValueMapper: (LiveData data, _) => data.time,
//                     yValueMapper: (LiveData data, _) => data.temperature)
//               ],
//               primaryXAxis: const NumericAxis(
//                 majorGridLines: MajorGridLines(
//                     width:
//                         1), // Enable grid lines for X-axis by setting width to 1
//                 edgeLabelPlacement: EdgeLabelPlacement.shift,
//                 interval: 1,
//                 title: AxisTitle(text: 'Time (seconds)'),
//               ),
//               primaryYAxis: const NumericAxis(
//                 axisLine: AxisLine(width: 0),
//                 majorTickLines: MajorTickLines(size: 0),
//                 majorGridLines: MajorGridLines(
//                     width:
//                         1), // Enable grid lines for Y-axis by setting width to 1
//                 title: AxisTitle(text: 'Temperature'),
//               ),
//             )
//           ],
//         ),
//       ),
//     ));
//   }

//   int time = 19;
//   void updateDataSource(Timer timer) {
//     chartData.add(LiveData(time++, double.parse(Temperature)));
//     chartData.removeAt(0);
//     _chartSeriesController.updateDataSource(
//         addedDataIndex: chartData.length - 1, removedDataIndex: 0);
//   }

//   List<LiveData> getChartData() {
//     return <LiveData>[
//       LiveData(
//         0,
//         double.parse(Temperature),
//       ),
//       LiveData(1, double.parse(Temperature)),
//       LiveData(2, double.parse(Temperature)),
//       LiveData(3, double.parse(Temperature)),
//       LiveData(4, double.parse(Temperature)),
//       LiveData(5, double.parse(Temperature)),
//       LiveData(6, double.parse(Temperature)),
//       LiveData(7, double.parse(Temperature)),
//       LiveData(8, double.parse(Temperature)),
//       LiveData(9, double.parse(Temperature)),
//       LiveData(10, double.parse(Temperature)),
//     ];
//   }
// }

// class LiveData {
//   LiveData(this.time, this.temperature);
//   final time;
//   final temperature;
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provista/Screens/Features/emergency.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'package:web_socket_channel/io.dart';

class Chart extends StatefulWidget {
  Chart({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  String temperature = "0";
  String updateTime = "0:0:0";
  late String modifiedTime = "0";
  List<dynamic> users = [];
  final channel = IOWebSocketChannel.connect('ws://10.10.101.207:4000');
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;
  bool emergencyPageOpened = false; // Flag to track emergency page status

  @override
  void initState() {
    chartData = [];
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
    super.initState();
    streamListener();
  }

  streamListener() {
    channel.stream.listen((message) {
      Map getdata = jsonDecode(message);
      setState(() {
        temperature = getdata["temperature"];
        double? temperatureDouble = double.tryParse(temperature);
        temperature = temperatureDouble?.toString() ?? "26";
        String Seconds = getdata["time"];
        String modified = Seconds.split(":").last;
        modifiedTime = modified;
        updateTime = Seconds;

        // Check if the temperature exceeds 40 and emergency page is not already opened
        if (temperatureDouble != null && temperatureDouble > 40 && !emergencyPageOpened) {
          // Set flag to true to prevent multiple openings of the emergency page
          emergencyPageOpened = true;
          // Navigate to the EmergencyPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EmergencyPage()),
          );
        }

        print(Seconds);
        print(temperature);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 500,
                  child: SfCartesianChart(
                    series: <LineSeries<LiveData, String>>[
                      LineSeries<LiveData, String>(
                        onRendererCreated: (ChartSeriesController controller) {
                          _chartSeriesController = controller;
                        },
                        dataSource: chartData,
                        color: const Color.fromRGBO(192, 108, 132, 1),
                        xValueMapper: (LiveData data, _) => data.time,
                        yValueMapper: (LiveData data, _) => data.temperature,
                      ),
                    ],
                    primaryXAxis: const CategoryAxis(
                      interval: 1,
                      title: AxisTitle(text: 'Time (seconds)'),
                    ),
                    primaryYAxis: const NumericAxis(
                      axisLine: AxisLine(width: 0),
                      majorTickLines: MajorTickLines(size: 1),
                      majorGridLines: MajorGridLines(width: 1),
                      title: AxisTitle(text: 'Temperature(°C)'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(updateTime, style: const TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateDataSource(Timer timer) {
    setState(() {
      chartData.add(LiveData(modifiedTime, double.parse(temperature)));
      if (chartData.length > 10) {
        chartData.removeAt(0);
      }
    });
    _chartSeriesController.updateDataSource();
  }
}

class LiveData {
  LiveData(this.time, this.temperature);
  final String time;
  final double temperature;
}

