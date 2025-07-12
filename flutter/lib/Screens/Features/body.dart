import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:provista/Screens/Features/3DModels/animation.dart";
import "package:provista/constants.dart";

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Stack(children: [
              SingleChildScrollView(
                child: Container(
                  height: 1750,
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(80),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 350),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Container(
                                height:
                                    20, // Adjust the height to match your text height or as needed
                                width: 10, // Adjust the width as needed
                                color: kPrimaryColor, // Set the color to blue
                              ),
                              const SizedBox(
                                  width:
                                      8), // Provides some spacing between the bar and the text
                              const Text(
                                'Our Application',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 30, left: 30),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topLeft: Radius.circular(20)),
                            color: Colors.white,
                          ),
                          height: 175, // Height of the container
                          child: const Center(
                            // Center the text inside the Container
                            child: Padding(
                              // Add Padding widget here
                              padding: EdgeInsets.all(
                                  16.0), // Adjust the padding value as needed
                              child: Text(
                                "   A wearable vest designed for miners working underground. It continuously monitors vital signs (e.g., heart rate, temperature), surrounding temperature, and location. Real-time data is wirelessly transmitted (e.g., via Wi-Fi) and stored securely in a database.", // The text you want to display
                                style: TextStyle(
                                  fontSize:
                                      14, // Adjust the font size as needed
                                  color: Colors
                                      .black54, // Adjust the text color as needed
                                  fontWeight: FontWeight
                                      .bold, // Adjust the font weight as needed
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //2
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Container(
                                  height:
                                      20, // Adjust the height to match your text height or as needed
                                  width: 10, // Adjust the width as needed
                                  color: kPrimaryColor, // Set the color to blue
                                ),
                                const SizedBox(
                                    width:
                                        8), // Provides some spacing between the bar and the text
                                const Text(
                                  'Activities',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 30, left: 30),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topLeft: Radius.circular(20)),
                            color: Colors.white,
                          ),
                          height: 200, // Height of the container
                          child: Center(
                            // Center the text inside the Container
                            child: Padding(
                              // Add Padding widget here
                              padding: const EdgeInsets.all(
                                  16.0), // Adjust the padding value as needed
                              child: Column(
                                children: [
                                  RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "1. ",
                                          style: TextStyle(
                                            color: Colors
                                                .black54, // Set the number color to blue
                                            fontWeight: FontWeight
                                                .bold, // Optional: makes the number bold
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "Producing and assembling the smart vest with its associated sensors\n",
                                          style: TextStyle(
                                            color: Colors
                                                .black54, // Adjust the text color as needed
                                            fontSize:
                                                14, // Adjust the font size as needed
                                            fontWeight: FontWeight
                                                .bold, // Adjust the font weight as needed
                                          ),
                                        ),
                                        TextSpan(
                                          text: "2. ",
                                          style: TextStyle(
                                            color: Colors
                                                .black54, // Set the number color to blue
                                            fontWeight: FontWeight
                                                .bold, // Optional: makes the number bold
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "Providing real-time and historical data analysis services\n",
                                          style: TextStyle(
                                            color: Colors
                                                .black54, // Adjust the text color as needed
                                            fontSize:
                                                14, // Adjust the font size as needed
                                            fontWeight: FontWeight
                                                .bold, // Adjust the font weight as needed
                                          ),
                                        ),
                                        TextSpan(
                                          text: "3. ",
                                          style: TextStyle(
                                            color: Colors
                                                .black54, // Set the number color to blue
                                            fontWeight: FontWeight
                                                .bold, // Optional: makes the number bold
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "Helping miners in case of emergencies\nContinuously innovating and improving the smart vest solution",
                                          style: TextStyle(
                                            color: Colors
                                                .black54, // Adjust the text color as needed
                                            fontSize:
                                                14, // Adjust the font size as needed
                                            fontWeight: FontWeight
                                                .bold, // Adjust the font weight as needed
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Container(
                                height:
                                    20, // Adjust the height to match your text height or as needed
                                width: 10, // Adjust the width as needed
                                color: kPrimaryColor, // Set the color to blue
                              ),
                              const SizedBox(
                                  width:
                                      8), // Provides some spacing between the bar and the text
                              const Text(
                                'Impact',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 30, left: 30),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topLeft: Radius.circular(20)),
                            color: Colors.white,
                          ),
                          height: 175, // Height of the container
                          child: const Center(
                            // Center the text inside the Container
                            child: Padding(
                              // Add Padding widget here
                              padding: EdgeInsets.all(
                                  16.0), // Adjust the padding value as needed
                              child: Text(
                                "     This technology has the potential to significantly improve miner safety and reduce the risk of fatalities in underground operations. By providing real-time data on vital signs, temperature, and location, this vest can empower faster intervention and potentially save lives.", // The text you want to display
                                style: TextStyle(
                                  fontSize:
                                      14, // Adjust the font size as needed
                                  color: Colors
                                      .black54, // Adjust the text color as needed
                                  fontWeight: FontWeight
                                      .bold, // Adjust the font weight as needed
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(
                        height: 70,
                      ),
                      
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        //color:kPrimaryColor,
                        height: height - 400,
                        width: width - 150,
                        child:
                            Animation3d(), // Assuming Animation3d is a widget you've defined
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(
                              80), // Adjust the radius value as needed
                        ),
                        child: Image.asset(
                          "assets/gif/mining.gif",
                          height: 275,
                          width: width,
                           // or BoxFit.cover depending on your preference
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
