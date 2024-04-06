part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent {}

class Reseting extends ResetPasswordEvent {
  Reseting(
      {required this.login, required this.password, required this.context});
  final String login;
  final String password;
  final BuildContext context;
}

class Reseted extends ResetPasswordEvent {
  Reseted(this.login, this.password);

  final String login;
  final String password;
}
