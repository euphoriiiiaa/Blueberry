import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(110, 164, 191, 1),
      appBar: AppBar(
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back2.png'), fit: BoxFit.fill)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  alignment: Alignment.center,
                  child: const Text(
                    textAlign: TextAlign.start,
                    'В этом окне можно зарегистрироваться',
                    style: TextStyle(
                      color: Color(0xffC2EFEB),
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 50),
                          hintFadeDuration: Durations.medium2,
                          prefixIcon: const Icon(
                            Icons.password_rounded,
                            color: Colors.black38,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Пароль",
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 50),
                          hintFadeDuration: Durations.medium2,
                          prefixIcon: const Icon(
                            Icons.password_rounded,
                            color: Colors.black38,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Повторите пароль",
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
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'ЗАРЕГИСТРИРОВАТЬСЯ',
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
                        'Уже есть аккаунт?',
                        style: TextStyle(
                            color: Color.fromRGBO(65, 51, 122, 1),
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Авторизоваться',
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
