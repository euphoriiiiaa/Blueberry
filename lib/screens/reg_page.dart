import 'package:blueberry/components/supabase_comp.dart';
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
  void initState() {
    SupabaseComp.initialize();
    client = SupabaseComp.supabase;
    super.initState();
  }

  void checkValidReg() async {
    if ((_loginController.text.isEmpty &&
            _passwordController.text.isEmpty &&
            !cardValid &&
            _fioController.text.isEmpty &&
            _numberController.text.isEmpty) ||
        (_loginController.text.isEmpty ||
            _passwordController.text.isEmpty ||
            !cardValid ||
            _fioController.text.isEmpty ||
            _numberController.text.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          showCloseIcon: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: Colors.red,
          content: Text(
            "Не все поля были заполнены.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      var clients = await client
          .from('clients')
          .select('login_client, number_client, bankcard_client');
      for (var item in clients) {
        if (item['login_client'] == _loginController.text ||
            item['number_client'] == _numberController.text ||
            item['bankcard_client'] == numberCardController.text) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              showCloseIcon: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              backgroundColor: Colors.red,
              content: Text(
                "Пользователь с таким логином, номером телефона или банковской картой уже существует.",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
          return;
        }
      }
      try {
        await client.from('clients').insert({
          'fullname_client': _fioController.text,
          'number_client': _numberController.text,
          'bankcard_client': numberCardController.text,
          'login_client': _loginController.text,
          'password_client': _passwordController.text
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            showCloseIcon: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            backgroundColor: Colors.green,
            content: Text(
              "Пользователь успешно зарегистрирован.",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        _fioController.clear();
        _loginController.clear();
        _numberController.clear();
        _passwordController.clear();
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            showCloseIcon: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            backgroundColor: Colors.red,
            content: Text(
              "Ошибка ${e.toString()}",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    }
  }

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
                    onPressed: checkValidReg,
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

class CreditCartReg extends StatefulWidget {
  const CreditCartReg({
    super.key,
  });

  @override
  State<CreditCartReg> createState() => _CreditCartRegState();
}

TextEditingController numberCardController = TextEditingController();
TextEditingController dateController = TextEditingController();
TextEditingController cvvController = TextEditingController();
bool cardValid = false;

class _CreditCartRegState extends State<CreditCartReg> {
  void checkInfoForCard() {
    if (((numberCardController.text.isEmpty &&
                numberCardController.text.length != 16) &&
            dateController.text.isEmpty &&
            cvvController.text.isEmpty) ||
        ((numberCardController.text.isEmpty ||
                numberCardController.text.length != 16) ||
            dateController.text.isEmpty ||
            cvvController.text.isEmpty)) {
      setState(() {
        cardValid = false;
      });
    } else {
      setState(() {
        cardValid = true;
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            errorText: numberCardController.text.isEmpty
                                ? "Данное поле обязательно для заполнения"
                                : null,
                            errorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            icon: const Icon(
                              Icons.add_card_rounded,
                              color: Color(0xff41337A),
                            ),
                            hintText: 'Номер банковской карты',
                          ),
                          controller: numberCardController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  errorText: dateController.text.isEmpty
                                      ? "Данное поле обязательно для заполнения"
                                      : null,
                                  errorBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  icon: const Icon(
                                    Icons.date_range,
                                    color: Color(0xff41337A),
                                  ),
                                  hintText: 'Срок действия',
                                ),
                                controller: dateController,
                                keyboardType: TextInputType.datetime,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(5),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  errorText: cvvController.text.isEmpty
                                      ? "Данное поле обязательно для заполнения"
                                      : null,
                                  errorBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  icon: const Icon(
                                    Icons.password,
                                    color: Color(0xff41337A),
                                  ),
                                  hintText: 'CVV-код',
                                ),
                                controller: cvvController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(3),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: checkInfoForCard,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xff41337A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Подтвердить',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
              );
            });
      },
      child: Container(
        alignment: Alignment.center,
        width: 250,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            const Text(
              'Привязать банковскую карту',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              cardValid ? "ПРИВЯЗАНА" : "НЕ ПРИВЯЗАНА",
              style: TextStyle(
                  color: cardValid
                      ? Colors.green.withOpacity(0.5)
                      : Colors.red.withOpacity(0.5),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
