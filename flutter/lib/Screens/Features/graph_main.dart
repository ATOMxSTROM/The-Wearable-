import "package:flutter/material.dart";
import "package:provista/Screens/Features/chart.dart";
import 'package:google_fonts/google_fonts.dart';

class GraphMain extends StatefulWidget {
  const GraphMain({super.key});

  @override
  State<GraphMain> createState() => _GraphMainState();
}

class _GraphMainState extends State<GraphMain> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Visual Representation",
          style: GoogleFonts.openSans(fontWeight: FontWeight.w500),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Temperature'),
            Tab(text: 'Heart Rate'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
         physics: NeverScrollableScrollPhysics(), 
        children:  [
          Chart(title: 'Hi',),
          Chart(title: 'Hi',),
        ],
      ),
    );
  }
}