import 'package:flutter/material.dart';
import 'package:provista/Screens/login/components2/rounded_button.dart';
import 'package:provista/Screens/login/components2/rounded_input.dart';
import 'package:provista/Screens/login/components2/rounded_password_input.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: size.width,
          height: defaultLoginSize,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                 const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),

                const SizedBox(height: 40),

                Image.asset('assets/images/programmer.png',width: 250,),

                const SizedBox(height: 40),

               const RoundedInput(icon: Icons.mail, hint: 'Username'),

                RoundedPasswordInput(hint: 'Password', onChanged: (value) { if (value.length < 8 || value.length > 15) {
                        // Show an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(
                              content:
                                  Text('Password must be 8 to 15 letters')),
                        );
                      } },),

               const SizedBox(height: 10),

               const RoundedButton(title: 'LOGIN',),

                const SizedBox(height: 10),

              ],
            ),
          ),
        ),
      ),
    );
  }
}