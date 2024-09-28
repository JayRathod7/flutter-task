import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:module6/screen/home.dart';
import 'package:module6/screen/register.dart';
import 'package:module6/utils/colors.dart';

import '../components/auth_textfield.dart';
import '../components/btn.dart';
import '../service/auth/auth_services.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  TextStyle lexend =
      GoogleFonts.lexend(textStyle: TextStyle(color: Colors.grey));

  void LogInMethod(BuildContext context) async {
    final authService = AuthService();

    if (emailController.text.isEmpty || passController.text.isEmpty) {
      CustomFunctions.showToastBox("all friends are required");
    } else {
      try {
        await authService.signInWithEmailAndPassword(
            emailController.text, passController.text);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        CustomFunctions.showToastBox(e.toString());
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 120),
            SizedBox(
                height: 120,
                width: 120,
                child: Center(
                    child: Lottie.asset(
                  "assets/chat_icon2.json",
                  fit: BoxFit.cover,
                ))),
            const SizedBox(height: 10),
            Text('Hey Chat!', style: GoogleFonts.lexend(fontSize: 36)),
            const SizedBox(height: 30),
            Text("Welcome Back, you've been missed",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.grey, fontSize: 16),
                )),
            const SizedBox(height: 24),
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: emailController,
            ),
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: passController,
            ),
            const SizedBox(height: 24),
            Btn(
              btnName: "Log in",
              onTap: () => LogInMethod(context),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style: lexend,
                ),
                GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        )),
                    child: Text(
                      "Register now",
                      style: GoogleFonts.lexend(
                          textStyle: TextStyle(color: Color(0xff00DDB3))),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
