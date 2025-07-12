import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provista/Screens/login/login.dart';

void main() {
  // Initialize WebView platform
  WidgetsFlutterBinding.ensureInitialized();
  SystemChannels.textInput.invokeMethod('TextInput.hide');

  // Run app
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   const SafeArea(
      child: MaterialApp(
        title: 'Login',
        debugShowCheckedModeBanner: false,
        home:LoginScreen(),
      ),
    );
  }
}
