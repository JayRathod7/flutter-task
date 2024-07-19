import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tasks/custom_widget/icon_button.dart';
import 'package:tasks/home_page.dart';
import 'package:tasks/screen/59/59_login_form.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  TextEditingController _name = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent.shade700,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  "https://t3.ftcdn.net/jpg/07/99/12/28/240_F_799122822_fNgZk0RJHG1sUX4PUpDrNCltbihF6Rfx.jpg",
                ),
                fit: BoxFit.cover,
                opacity: 0.09)),
        // color: Colors.yellow,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Text(
                "Welcome \nBack",
                style: TextStyle(
                    fontSize: 60, fontWeight: FontWeight.w500, height: 1.1),
              ),
              SizedBox(height: 10),
              Text(
                "Sign Up to join",
                style: TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.w400,
                    color: Colors.black87,
                    letterSpacing: 2,
                    wordSpacing: 4),
              ),
              SizedBox(height: 50),
              TextField(
                controller: _name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "John Cena",
                    hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                    filled: true,
                    // fillColor: Colors.grey.withOpacity(0.4),
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.only(left: 60, right: 10),
                    prefixIcon: Icon(
                      Icons.person_2,
                      color: Colors.black26,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6))),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _number,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "+91 96389 10954",
                    hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                    filled: true,
                    // fillColor: Colors.grey.withOpacity(0.4),
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.only(left: 60, right: 10),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.black26,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6))),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _email,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "John@gamil.com",
                    hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                    filled: true,
                    // fillColor: Colors.grey.withOpacity(0.4),
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.only(left: 60, right: 10),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black26,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6))),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _password,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "*************",
                    hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                    filled: true,
                    // fillColor: Colors.grey.withOpacity(0.4),
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.only(left: 60, right: 10),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black26,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6))),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(
                      shape: CircleBorder(),
                      value: isChecked,
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                      onChanged: (onChanged) {
                        isChecked = onChanged!;
                        setState(() {});
                      }),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "I Agree to the ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16)),
                    TextSpan(
                      text: "Terms and Conditions",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          color: Colors.blue),
                    )
                  ])),
                ],
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text("Register",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)))),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomIconBtn(img: "assets/google.png", name: "Google"),
                  CustomIconBtn(img: "assets/fb_logo.png", name: "FaceBook"),
                  CustomIconBtn(img: "assets/x_logo.png", name: "X"),
                ],
              ),
              Divider(color: Colors.black12, indent: 30, endIndent: 30),
              SizedBox(height: 10),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "Have an account? ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16)),
                      TextSpan(
                          text: " Sign in",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600,
                              fontSize: 16))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
