
import 'package:flutter/material.dart';
import 'package:provista/Screens/Home/components/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavBar(),
    );
  }
}




































// import 'package:flutter/material.dart';
// import 'package:provista/Screens/Features/animation.dart';
// import 'package:provista/Screens/Features/emergency.dart';
// import 'package:provista/Screens/Features/graph_main.dart';
// import 'package:provista/Screens/Features/numeric_screen.dart';
// import 'package:provista/Screens/Home/data/data.dart';
// import 'package:provista/Screens/Home/model/speciality.dart';
// import 'package:provista/Screens/Home/views/home2.dart';
// import 'package:provista/constants.dart';

// String? selectedCategorie = "First";



// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   HomeScreenState createState() => HomeScreenState();
// }

// class HomeScreenState extends State<HomeScreen> {
//   late List<SpecialityModel> specialities;
//   int _selectedIndex = 2; // Default active button is the floating action button
//   final _pageOptions = [
//     const Numeric(),
//     const GraphMain(),
//     const Home2(),
//      // Empty container for the floating action button
    
//     const Animation3d(),
//     const EmergencyPage(),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     specialities = getSpeciality();
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: _pageOptions[_selectedIndex], // This line is changed
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => _onItemTapped(2),
//           backgroundColor: _selectedIndex == 2 ? kPrimaryColor : Colors.black87,
//           foregroundColor: Colors.white,
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(50.0))),
//           child: const Icon(Icons.home),
//         ),


//         bottomNavigationBar: BottomAppBar(
//           height: 100,
          
//           notchMargin: 5.0,
//           shape: const CircularNotchedRectangle(),
//           color: Colors.black87,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             mainAxisSize: MainAxisSize.max,
//             children: [
           
//               Padding(
//                 padding: const EdgeInsets.only( bottom: 8.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.numbers,
//                           color:
//                               _selectedIndex == 0 ? kPrimaryColor : Colors.white,
//                               size: 20,),
//                       onPressed: () => _onItemTapped(0),
//                     ),
//                     const Text('Numeric',style: TextStyle(fontSize: 10 ,color: Colors.white),)
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only( bottom: 8.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.animation,
//                           color:
//                               _selectedIndex == 1 ? kPrimaryColor : Colors.white),
//                       onPressed: () => _onItemTapped(1),
//                     ),
//                     const Text('Chart',style: TextStyle(fontSize: 10 ,color: Colors.white),)
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 25,
//               ),
//               Padding
//               (padding: const EdgeInsets.only( bottom: 8.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.graphic_eq,
//                           color:
//                               _selectedIndex == 3 ? kPrimaryColor: Colors.white),
//                       onPressed: () => _onItemTapped(3),
//                     ),
//                     const Text('3D',style: TextStyle(fontSize: 10 ,color: Colors.white),)
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only( bottom: 8.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.emergency_share,
//                           color:
//                               _selectedIndex == 4 ?kPrimaryColor : Colors.white),
//                       onPressed: () => _onItemTapped(4),
//                     ),
//                     const Text('Emergency',style: TextStyle(fontSize: 10 ,color: Colors.white),)
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         // ... rest of your code

// // class HomeScreenState extends State<HomeScreen> {
// //   late List<SpecialityModel> specialities;

// //   @override
// //   void initState() {
// //     super.initState();

// //     specialities = getSpeciality();
// //   }

// //   @override
//         // Widget build(BuildContext context) {
//         //   return MaterialApp(
//         //     debugShowCheckedModeBanner: false,
//         //     home: Scaffold(
//         //       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         //       floatingActionButton: FloatingActionButton(
//         //         onPressed: () {},
//         //         backgroundColor: Colors.black,
//         //         foregroundColor: Colors.white,
//         //         shape: const RoundedRectangleBorder(
//         //             borderRadius: BorderRadius.all(Radius.circular(50.0))),
//         //         child: const Icon(Icons.home),
//         //       ),

//         //       bottomNavigationBar: const BottomAppBar(
//         //         notchMargin: 5.0,
//         //         shape: CircularNotchedRectangle(),
//         //         color: Colors.black,
//         //         child: Row(
//         //           mainAxisAlignment: MainAxisAlignment.spaceAround,
//         //           mainAxisSize: MainAxisSize.max,
//         //           children: [
//         //             Padding(

//         //               padding: EdgeInsets.only(left: 3.0),
//         //               child: Column(
//         //                 mainAxisSize: MainAxisSize.min,
//         //                 children: [
//         //                   Icon(
//         //                     Icons.numbers,
//         //                     color: Colors.white,
//         //                   ),
//         //                   Text(
//         //                     "Integer",
//         //                     style: TextStyle(
//         //                       color: Colors.white,
//         //                     ),
//         //                   )
//         //                 ],
//         //               ),
//         //             ),
//         //             Padding(
//         //               padding: EdgeInsets.only(left: 2.0),
//         //               child: Column(
//         //                 mainAxisSize: MainAxisSize.min,
//         //                 children: [
//         //                   Icon(
//         //                     Icons.animation,
//         //                     color: Colors.white,
//         //                   ),
//         //                   Text(
//         //                     "3D",
//         //                     style: TextStyle(
//         //                       color: Colors.white,
//         //                     ),
//         //                   )
//         //                 ],
//         //               ),
//         //             ),
//         //             SizedBox(width: 25,),
//         //             Padding(
//         //               padding: EdgeInsets.only(left: 10.0),
//         //               child: Column(
//         //                 mainAxisSize: MainAxisSize.min,
//         //                 children: [
//         //                   Icon(
//         //                     Icons.graphic_eq,
//         //                     color: Colors.white,
//         //                   ),
//         //                   Text(
//         //                     "Chart",
//         //                     style: TextStyle(
//         //                       color: Colors.white,
//         //                     ),
//         //                   )
//         //                 ],
//         //               ),
//         //             ),
//         //             Padding(
//         //               padding: EdgeInsets.only(left: 5,right: 3.0),
//         //               child: Column(
//         //                 mainAxisSize: MainAxisSize.min,
//         //                 children: [
//         //                   Icon(
//         //                     Icons.emergency_share,
//         //                     color: Colors.white,
//         //                   ),
//         //                   Text(
//         //                     "SOS",
//         //                     style: TextStyle(
//         //                       color: Colors.white,
//         //                     ),
//         //                   )
//         //                 ],
//         //               ),
//         //             )
//         //           ],
//         //         ),
//         //       ),
        
//       ),
//     );
//   }
// }
