part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordLoaded extends ResetPasswordState {}

final class ResetPasswordFailedLoaded extends ResetPasswordState {}