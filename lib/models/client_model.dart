// ignore_for_file: non_constant_identifier_names

class ClientModel {
  final String fullname_client;
  final String number_client;
  final String bankcard_client;
  final String login_client;
  final String password_client;

  ClientModel(
      {required this.fullname_client,
      required this.number_client,
      required this.bankcard_client,
      required this.login_client,
      required this.password_client});
}
