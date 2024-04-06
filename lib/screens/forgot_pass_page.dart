import 'package:blueberry/components/loading_widget.dart';
import 'package:blueberry/services/bloc/reset_password_bloc.dart';
import 'package:blueberry/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({super.key});

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

TextEditingController _loginController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _ForgotPassPageState extends State<ForgotPassPage> {
  late final ResetPasswordBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = ResetPasswordBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.ligthBlue,
        appBar: AppBar(),
        body: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is ResetPasswordLoading) {
              return const LoadingWidget();
            }
            if (state is ResetPasswordInitial) {
              return SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/back2.png'),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Здесь можно восстановить свой пароль",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
                        ),
                        const Text(
                          "Если вы его забыли...",
                          style: TextStyle(
                              color: Colors.white30,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 5),
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
                                hintStyle:
                                    const TextStyle(color: Colors.black38),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: TextField(
                            controller: _passwordController,
                            textAlign: TextAlign.center,
                            obscureText: true,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                hintFadeDuration: Durations.medium2,
                                prefixIcon: const Icon(
                                  Icons.password,
                                  color: Colors.black38,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Пароль",
                                hintStyle:
                                    const TextStyle(color: Colors.black38),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 150),
                          child: GestureDetector(
                            onTap: () async => {
                              bloc.add(Reseting(
                                  login: _loginController.text,
                                  password: _passwordController.text,
                                  context: context))
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 100),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: MyColors.darkPurple,
                              ),
                              child: const Text(
                                "ВОССТАНОВИТЬ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
