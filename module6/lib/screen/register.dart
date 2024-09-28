import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:module6/components/auth_textfield.dart';
import 'package:module6/screen/home.dart';
import 'package:module6/utils/colors.dart';

import '../components/btn.dart';
import '../service/auth/auth_services.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController cPassController = TextEditingController();

  void registerMethod(BuildContext context) async {
    final auth = AuthService();

    // Clear previous error messages

    if (cPassController.text == passController.text) {
      String email = emailController.text.trim();
      String password = passController.text.trim();
      String cPass = passController.text.trim();

      if (email.isEmpty && password.isEmpty && cPass.isEmpty) {
        CustomFunctions.showToastBox("Please fill in all fields");
      }

      if (!email.contains('@') || !email.contains('.')) {
        CustomFunctions.showToastBox("Please enter a valid email address");
      }

      if (password.length < 6) {
        CustomFunctions.showToastBox(
            "Password must be at least 6 characters long");
      }

      try {
        await auth.signUpWithEmailAndPassword(email, password);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {}
    } else {
      CustomFunctions.showToastBox("Password does not match");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                  child: Center(
                      child: Lottie.asset(
                    "assets/chat_icon2.json",
                    fit: BoxFit.cover,
                  ))),
              const SizedBox(height: 10),
              Text('Hey Chat!', style: GoogleFonts.lexend(fontSize: 36)),
              const SizedBox(height: 20),
              Text('Create an account to start chatting',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  )),
              SizedBox(height: 40),
              Column(
                children: [
                  MyTextField(
                    controller: emailController,
                    hintText: "Email",
                  ),
                  MyTextField(
                    controller: passController,
                    hintText: "Password",
                  ),
                  MyTextField(
                      controller: cPassController,
                      hintText: "Confirm Password"),
                ],
              ),
              const SizedBox(height: 40),
              Btn(btnName: "Register", onTap: () => registerMethod(context)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: GoogleFonts.lexend(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogIn(),
                      ),
                    ),
                    child: Text(
                      'Log in',
                      style: GoogleFonts.lexend(
                          textStyle: TextStyle(color: Color(0xff00DDB3))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
