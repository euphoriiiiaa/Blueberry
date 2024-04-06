import 'dart:developer';

import 'package:blueberry/models/supabase_comp.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyFunctions {
  static void myToast(String message, Color color, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Text(
            textAlign: TextAlign.center,
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  static void checkValidReg(
      TextEditingController login,
      TextEditingController password,
      TextEditingController fio,
      TextEditingController number,
      bool cardValid,
      TextEditingController bankCard,
      BuildContext context) async {
        SupabaseComp.initialize();
    SupabaseClient client = SupabaseComp.supabase;
    if ((login.text.isEmpty &&
            password.text.isEmpty &&
            !cardValid &&
            fio.text.isEmpty &&
            number.text.isEmpty) ||
        (login.text.isEmpty ||
            password.text.isEmpty ||
            !cardValid ||
            fio.text.isEmpty ||
            number.text.isEmpty)) {
      MyFunctions.myToast("Не все поля были заполнены.", Colors.red, context);
    } else {
      var clients = await client
          .from('clients')
          .select('login_client, number_client, bankcard_client');
      for (var item in clients) {
        if (item['login_client'] == login.text ||
            item['number_client'] == number.text ||
            item['bankcard_client'] == bankCard.text) {
              if (context.mounted) {
                MyFunctions.myToast(
              'Пользователь с таким логином, номером телефона или банковской картой уже существует.',
              Colors.red,
              context);
              }
          return;
        }
      }
      try {
        await client.from('clients').insert({
          'fullname_client': fio.text,
          'number_client': number.text,
          'bankcard_client': bankCard.text,
          'login_client': login.text,
          'password_client': password.text
        });
        if (context.mounted) {
          MyFunctions.myToast(
            "Пользователь успешно зарегистрирован.", Colors.green, context);
        }
        fio.clear();
        login.clear();
        number.clear();
        password.clear();
        if (context.mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        if (context.mounted) {
          MyFunctions.myToast("Ошибка ${e.toString()}", Colors.red, context);
        }
      }
    }
  }

  static Future<void> tryToResetPassword (
      String login, String newPassword, BuildContext context) async {
    if ((login.isEmpty && newPassword.isEmpty) ||
        (login.isEmpty || newPassword.isEmpty)) {
      myToast("Пожалуйста, укажите все нужные поля.", Colors.red, context);
      return;
    }
    SupabaseComp.initialize();
    SupabaseClient client = SupabaseComp.supabase;
    var clients =
        await client.from('clients').select('login_client, password_client');
    log(clients.toString());
    for (var item in clients) {
      log("Найден: $item");
      if (item['login_client'] == login) {
        await client
            .from('clients')
            .update({'password_client': newPassword}).match(
                {'login_client': item['login_client']});
        if (context.mounted) {
          myToast("Пароль успешно изменен.", Colors.green, context);
          Navigator.pop(context);
        }
        return;
      }
    }
    if (context.mounted) {
      myToast("Извините, пользователь с таким логином не был найден.",
          Colors.red, context);
    }
  }
}
