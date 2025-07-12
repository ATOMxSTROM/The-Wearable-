import 'package:flutter/material.dart';
import 'package:provista/Screens/login/components2/rounded_button.dart';
import 'package:provista/Screens/login/components2/rounded_input.dart';
import 'package:provista/Screens/login/components2/rounded_password_input.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
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
    return  AnimatedOpacity(
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration * 5,
      child: Visibility(
        visible: !isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: size.width,
            height: defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                 const Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                 const SizedBox(height: 40),
                  Image.asset(
                    'assets/images/mines.png',
                    width: 250,
                  ),
                 const SizedBox(height: 40),
                 const RoundedInput(icon: Icons.mail, hint: 'Username'),
                const  RoundedInput(icon: Icons.face_rounded, hint: 'Name'),
                  RoundedPasswordInput(
                    hint: 'Password',
                    onChanged: (value) {
                      if (value.length < 8 || value.length > 15) {
                        // Show an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                        const  SnackBar(
                              content:
                                  Text('Password must be 8 to 15 letters')),
                        );
                      }
                    },
                  ),
                 const SizedBox(height: 10),
                 const RoundedButton(title: 'SIGN UP'),
                 const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
