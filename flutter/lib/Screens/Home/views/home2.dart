import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:provista/Screens/Features/body.dart";
import "package:provista/constants.dart";

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! > 0) {
          // Swiped from left to right
          _scaffoldKey.currentState!.openDrawer();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        // Remove this line to enable swipe gestures
        // drawerEnableOpenDragGesture: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black87),
          title: Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Provista!",
                  style: TextStyle(
                      color: Colors.black87.withOpacity(0.8),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 10,
                ),
                ClipOval(
                  child: Image.asset(
                    'assets/images/Provista.jpeg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.7,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kPrimaryColor,
                  Colors.white,
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                Center(
                  // Center the image horizontally
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0), // Adjust the padding as needed
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/Provista.jpeg',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),
                // Other widgets like the header image and SizedBox go here
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: const Icon(Icons.person, color: Colors.white),
                        title: const Text('Profile',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          // Your code for 'Profile' tap
                        },
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.settings, color: Colors.white),
                        title: const Text('Settings',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {
                          // Your code for 'Settings' tap
                        },
                      ),
                    ],
                  ),
                ),
                // Place the Dark Mode option here, outside the ListView but inside the Column
                ListTile(
                  leading: const Icon(Icons.dark_mode, color: Colors.white),
                  title: const Text('Dark Mode',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Your code for 'Dark Mode' tap
                  },
                ),

                const SizedBox(
                  height: 75,
                )
              ],
            ),
          ),
        ),
        body: HomeBody(),
      ),
    );
  }
}
