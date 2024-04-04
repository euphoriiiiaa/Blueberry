import 'dart:developer';

import 'package:blueberry/components/supabase_comp.dart';
import 'package:blueberry/models/data.dart';
import 'package:blueberry/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

late SupabaseClient client;
TextEditingController _loginController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    SupabaseComp.initialize();
    client = SupabaseComp.supabase;
    super.initState();
  }

  void attemptToLogin() async {
    try {
      if ((_loginController.text.isEmpty && _passwordController.text.isEmpty) ||
          (_loginController.text.isEmpty || _passwordController.text.isEmpty)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            showCloseIcon: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            backgroundColor: Colors.red,
            content: Text(
              "Заполните все поля.",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        return;
      }
      var clients = await client
          .from('clients')
          .select('login_client, password_client, fullname_client');
      for (var item in clients) {
        if (item['login_client'] == _loginController.text &&
            item['password_client'] == _passwordController.text) {
              Data.fioClient = item['fullname_client'];
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              showCloseIcon: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              backgroundColor: Colors.red,
              content: Text(
                "Добро пожаловать, ${item['fullname_client']}!",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
          _loginController.clear();
          _passwordController.clear();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(),
            ),
          );
          break;
        }
      }
    } catch (e) {
      log('ошибка ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back.png'), fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/back_logo.png',
                  height: 300,
                  width: 400,
                ),
                const Text(
                  'Добро пожаловать!',
                  style: TextStyle(
                      color: Color.fromRGBO(65, 51, 122, 1),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  textAlign: TextAlign.start,
                  'Для продолжения необходимо авторизоваться',
                  style: TextStyle(color: Color.fromRGBO(65, 51, 122, 1)),
                ),
                const Text(
                  textAlign: TextAlign.start,
                  'или зарегистрироваться',
                  style: TextStyle(
                      color: Color.fromRGBO(65, 51, 122, 1),
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      controller: _loginController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 50),
                          hintFadeDuration: Durations.medium2,
                          prefixIcon: const Icon(
                            Icons.person_2_rounded,
                            color: Colors.black38,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Логин",
                          hintStyle: const TextStyle(color: Colors.black38),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.white))),
                    ),
                  ),
                ),
                const MyTextField(
                  hint: "Пароль",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: ElevatedButton(
                    onPressed: attemptToLogin,
                    child: const Text(
                      'ВОЙТИ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Забыли пароль?',
                        style: TextStyle(
                            color: Color.fromRGBO(65, 51, 122, 1),
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Восстановить',
                          style: TextStyle(
                              color: Color.fromRGBO(65, 51, 122, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Еще нет аккаунта?',
                        style: TextStyle(
                            color: Color.fromRGBO(65, 51, 122, 1),
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/reg_page');
                        },
                        child: const Text(
                          'Создать',
                          style: TextStyle(
                              color: Color.fromRGBO(65, 51, 122, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatefulWidget {
  final String hint;
  const MyTextField({super.key, required this.hint});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: _passwordController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 50),
              hintFadeDuration: Durations.medium2,
              prefixIcon: const Icon(
                Icons.password_rounded,
                color: Colors.black38,
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: widget.hint,
              hintStyle: const TextStyle(color: Colors.black38),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.white))),
        ),
      ),
    );
  }
}
