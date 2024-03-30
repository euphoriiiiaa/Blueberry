import 'package:blueberry/screens/auth_page.dart';
import 'package:blueberry/screens/forgot_pass_page.dart';
import 'package:blueberry/screens/main_page.dart';
import 'package:blueberry/screens/reg_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(65, 51, 122, 1),
        appBarTheme: const AppBarTheme(backgroundColor:  Color.fromRGBO(65, 51, 122, 1),),
        textTheme: const TextTheme(
          labelMedium: TextStyle(color: Color.fromRGBO(65, 51, 122, 1), fontSize: 30, fontWeight: FontWeight.bold),
          labelSmall: TextStyle(color:  Color.fromRGBO(110, 164, 191, 1), fontSize: 20)
        ),
        useMaterial3: true,
      ),
      home: const AuthPage(),
      routes: {
        '/reg_page': (context) => const RegPage(),
        '/forgot_pass_page': (context) => const ForgotPassPage(),
        '/main_page':(context) => const MainPage()
      },
    );
  }
}