import 'package:blueberry/screens/auth_page.dart';
import 'package:blueberry/screens/forgot_pass_page.dart';
import 'package:blueberry/screens/main_page.dart';
import 'package:blueberry/screens/reg_page.dart';
import 'package:blueberry/theme/colors.dart';
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
        appBarTheme: const AppBarTheme(
          backgroundColor: MyColors.darkPurple,
        ),
        textTheme: const TextTheme(
            labelMedium: TextStyle(
                color: MyColors.darkPurple,
                fontSize: 30,
                fontWeight: FontWeight.bold),
            labelSmall: TextStyle(
                color: MyColors.ligthBlue, fontSize: 20)),
        useMaterial3: true,
      ),
      home: const AuthPage(),
      routes: {
        '/reg_page': (context) => const RegPage(),
        '/forgot_pass_page': (context) => const ForgotPassPage(),
        '/main_page': (context) => const MainPage()
      },
    );
  }
}
