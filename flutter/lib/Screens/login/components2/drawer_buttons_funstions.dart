// import 'package:flutter/material.dart';
// import 'package:provista/Screens/Features/chart.dart';
// import 'package:provista/Screens/Features/emergency.dart';
// import 'package:provista/Screens/Features/latest_information.dart';
// import 'package:provista/Screens/Home/views/home.dart';

// class CategorieTile extends StatefulWidget {
//   final String? categorie;
//   final bool? isSelected;
//   final HomeScreenState? context;
//   const CategorieTile(
//       {super.key, this.categorie, this.isSelected, this.context});

//   @override
//   // ignore: library_private_types_in_public_api
//   _CategorieTileState createState() => _CategorieTileState();
// }

// class _CategorieTileState extends State<CategorieTile> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         widget.context!.setState(() {
//           selectedCategorie = widget.categorie;
//         });
//       },
//       child: Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         margin: const EdgeInsets.only(left: 8),
//         height: 30,
//         decoration: BoxDecoration(
//             color: widget.isSelected!
//                 ? const Color.fromARGB(255, 186, 191, 250)
//                 : Colors.white,
//             borderRadius: BorderRadius.circular(30)),
//         child: Text(
//           widget.categorie!,
//           style: TextStyle(
//               color: widget.isSelected!
//                   ? const Color.fromARGB(255, 51, 51, 51)
//                   : const Color(0xffA1A1A1)),
//         ),
//       ),
//     );
//   }
// }

// class SpecialistTile extends StatelessWidget {
//   final Widget? imgAssetPath;
//   final String? speciality;
//   final Color? backColor;
//   const SpecialistTile(
//       {super.key,
//       required this.imgAssetPath,
//       required this.speciality,
//       required this.backColor});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         if (speciality == "Chart") {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: const Text(' Information'),
//                 //content: const Padding(padding: EdgeInsets.only(top:0,bottom: 20)),
//                 actions: <Widget>[
//                   Column(
//                     children: [
//                       SizedBox(
//                         width: 300,
//                         height: 70,
//                         child: TextButton(
//                           child: const Text('Temperature'),
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   title: const Text('Temperature Information'),
//                                   content: const SizedBox(
//                                     height: 250,
//                                     width: 500,
//                                     child: Chart(),
//                                   ),
//                                   actions: <Widget>[
//                                     TextButton(
//                                       child: const Text('Close'),
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                       },
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       ),
//                       SizedBox(
//                         width: 300,
//                         height: 70,
//                         child: TextButton(
//                           child: const Text('Pressure'),
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   title: const Text('Pressure Information'),
//                                   content: const SizedBox(
//                                     height: 250,
//                                     width: 500,
//                                     child: Chart(),
//                                   ),
//                                   actions: <Widget>[
//                                     TextButton(
//                                       child: const Text('Cancel'),
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                       },
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             },
//           );
//         }

//         if (speciality == "Latest Information") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const LatestInfo()),
//           );
//         }
//         if (speciality == "Emergency") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const EmergencyPage()),
//           );
//         }
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         width: MediaQuery.of(context).size.width * 20,
//         margin: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: backColor,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Expanded(
//                   child: Text(
//                     speciality!,
//                     style: const TextStyle(color: Colors.white, fontSize: 14),
//                   ),
//                 ),
//                 const Icon(
//                   Icons.arrow_right,
//                   size: 20,
//                   color: Color.fromARGB(255, 191, 191, 191),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
