import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import "package:provista/Screens/Features/numeric/numeric_1.dart";
import "package:provista/Screens/Features/numeric/numeric_2.dart";

class NumericScreen extends StatefulWidget {
  const NumericScreen({super.key});

  @override
  State<NumericScreen> createState() => _NumericScreenState();
}

class _NumericScreenState extends State<NumericScreen> with SingleTickerProviderStateMixin {
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
          "Real Time Data",
          style: GoogleFonts.openSans(fontWeight: FontWeight.w500),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Current data'),
            Tab(text: 'Past Data'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(), // This line disables swipe navigation
        children: const [
          Numeric(),
          SearchNumeric (),
        ],
      ),
    );
  }
}