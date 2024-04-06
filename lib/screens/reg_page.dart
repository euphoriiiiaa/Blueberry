import 'package:blueberry/components/credit_card_reg.dart';
import 'package:blueberry/functions/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

TextEditingController _loginController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _fioController = TextEditingController();
TextEditingController _numberController = TextEditingController();
late SupabaseClient client;

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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  alignment: Alignment.center,
                  child: const Text(
                    textAlign: TextAlign.start,
                    'В этом окне можно зарегистрироваться',
                    style: TextStyle(
                        color: Color(0xffC2EFEB),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
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
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(12)
                      ],
                      controller: _numberController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 50),
                          hintFadeDuration: Durations.medium2,
                          prefixIcon: const Icon(
                            Icons.mobile_friendly,
                            color: Colors.black38,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Номер телефона",
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      controller: _fioController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 50),
                          hintFadeDuration: Durations.medium2,
                          prefixIcon: const Icon(
                            Icons.data_object,
                            color: Colors.black38,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "ФИО",
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      obscureText: true,
                      controller: _passwordController,
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
                const Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: CreditCartReg(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () => MyFunctions.checkValidReg(_loginController, _passwordController, _fioController, numberCardController, cardValid, numberCardController, context),
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
