import 'package:flutter/material.dart';
import 'package:provista/Screens/Features/3DModels/emergency3d.dart';
import 'package:provista/Screens/Home/components/bottom_nav_bar.dart';
import 'package:provista/Screens/Home/views/home2.dart';
import 'package:provista/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class EmergencyPage extends StatelessWidget {
   const EmergencyPage({super.key});
   

  @override
  Widget build(BuildContext context) {
        double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
return Scaffold(
 appBar: AppBar(
  backgroundColor: kPrimaryColor.withOpacity(0.1), // Set the background color to blue
  title: Text(
    "Mining Emergency",
    style: GoogleFonts.openSans(
      fontWeight: FontWeight.w500,
      fontSize: 24.0,
      color: kPrimaryColor,
    ),
  ),
  leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Home2()));
      Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavBar()));
    },
  ), 
),
  body:  SingleChildScrollView(
    child: Container(
    
      color: kPrimaryColor.withOpacity(0.1),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),


          const Text("Section 1",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          Center(
            child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            //color:kPrimaryColor,
                            height: height - 600,
                            width: width - 150,
                            child:
                                Emergency3D(), // Assuming Animation3d is a widget you've defined
                          ),
          ),
          SizedBox(height: 20.0),
          
          
          
          
          
          
          // Container(
          //                       padding: const EdgeInsets.only(top: 30, left: 30),
          //                       child: Container(
          //                         decoration: const BoxDecoration(
          //                           borderRadius: BorderRadius.only(
          //                               bottomLeft: Radius.circular(20),
          //                               topLeft: Radius.circular(20)),
          //                           color: Colors.white,
          //                         ),
          //                         height: 200, // Height of the container
          //                         child: Center(
          //                           // Center the text inside the Container
          //                           child: Padding(
          //                             // Add Padding widget here
          //                             padding: const EdgeInsets.all(
          //                                 16.0), // Adjust the padding value as needed
          //                             child: Column(
          //                               children: [
          //                                 RichText(
          //                                   text: const TextSpan(
          //                                     children: [
          //                                       TextSpan(
          //                                         text: "1. ",
          //                                         style: TextStyle(
          //                                           color: Colors
          //                                               .black54, // Set the number color to blue
          //                                           fontWeight: FontWeight
          //                                               .bold, // Optional: makes the number bold
          //                                         ),
          //                                       ),
          //                                       TextSpan(
          //                                         text:
          //                                             "Producing and assembling the smart vest with its associated sensors\n",
          //                                         style: TextStyle(
          //                                           color: Colors
          //                                               .black54, // Adjust the text color as needed
          //                                           fontSize:
          //                                               14, // Adjust the font size as needed
          //                                           fontWeight: FontWeight
          //                                               .bold, // Adjust the font weight as needed
          //                                         ),
          //                                       ),
          //                                       TextSpan(
          //                                         text: "2. ",
          //                                         style: TextStyle(
          //                                           color: Colors
          //                                               .black54, // Set the number color to blue
          //                                           fontWeight: FontWeight
          //                                               .bold, // Optional: makes the number bold
          //                                         ),
          //                                       ),
          //                                       TextSpan(
          //                                         text:
          //                                             "Providing real-time and historical data analysis services\n",
          //                                         style: TextStyle(
          //                                           color: Colors
          //                                               .black54, // Adjust the text color as needed
          //                                           fontSize:
          //                                               14, // Adjust the font size as needed
          //                                           fontWeight: FontWeight
          //                                               .bold, // Adjust the font weight as needed
          //                                         ),
          //                                       ),
          //                                       TextSpan(
          //                                         text: "3. ",
          //                                         style: TextStyle(
          //                                           color: Colors
          //                                               .black54, // Set the number color to blue
          //                                           fontWeight: FontWeight
          //                                               .bold, // Optional: makes the number bold
          //                                         ),
          //                                       ),
          //                                       TextSpan(
          //                                         text:
          //                                             "Helping miners in case of emergencies\nContinuously innovating and improving the smart vest solution",
          //                                         style: TextStyle(
          //                                           color: Colors
          //                                               .black54, // Adjust the text color as needed
          //                                           fontSize:
          //                                               14, // Adjust the font size as needed
          //                                           fontWeight: FontWeight
          //                                               .bold, // Adjust the font weight as needed
          //                                         ),
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 )
          //                               ],
          //                             ),
          //                           ),
          //                         ),
          //                       ),
          //                     ),
                        
          //                     Padding(
          //                       padding: const EdgeInsets.only(top: 50),
          //                       child: Align(
          //                         alignment: Alignment.centerLeft,
          //                         child: Row(
          //                           children: [
          //                             Container(
          //                               height:
          //                                   20, // Adjust the height to match your text height or as needed
          //                               width: 10, // Adjust the width as needed
          //                               color: kPrimaryColor, // Set the color to blue
          //                             ),
          //                             const SizedBox(
          //                                 width:
          //                                     8), // Provides some spacing between the bar and the text
          //                             const Text(
          //                               'Impact',
          //                               style: TextStyle(
          //                                 fontSize: 20,
          //                                 fontWeight: FontWeight.bold,
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          
          
                   Text(
                'Mining Emergency',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              Text(
                'In case of emergency in the quarry:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '1. Stay Calm: Assess the situation and don’t panic.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '2. Evacuate: Move to a safe area away from the danger zone.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '3. Alert Authorities: Call emergency services immediately.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '4. Communicate: Inform colleagues and supervisors about the situation.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Safety Measures:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '1. Wear Personal Protective Equipment (PPE) at all times.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '2. Follow safety protocols and procedures set by the company.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '3. Attend regular safety training sessions to stay informed.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Contact Information:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'In case of emergency, contact:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                '- Emergency Services: 112',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '- Quarry Supervisor: [Supervisor’s Phone Number]',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Remember: Safety First!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 200,)
            ],
          ),
    ),
  ),
    );
  }
}

