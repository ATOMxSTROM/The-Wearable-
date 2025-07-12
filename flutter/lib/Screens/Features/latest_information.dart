import "package:flutter/material.dart";


class LatestInfo extends StatefulWidget {
  const LatestInfo({super.key});

  @override
  State<LatestInfo> createState() => _LatestInfoState();
}

class _LatestInfoState extends State<LatestInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    leading: IconButton(
      icon:const Icon(Icons.arrow_back), 
      onPressed: () => Navigator.pop(context),
    ),
  ),
  body:const Text("data"),
);
  }
}