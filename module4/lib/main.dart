import 'package:flutter/material.dart';
import 'package:module4/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            color: Colors.black,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // initialRoute: "/",
      // routes: {
      //   '/': (context) => HomePage(),
      //   '/showBox': (context) => ShowDialogBox()
      // },
      home: const HomePage(),
    );
  }
}
