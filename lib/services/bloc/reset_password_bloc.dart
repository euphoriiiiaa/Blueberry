import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../functions/my_functions.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    on<Reseting>((event, emit) async {
      emit(ResetPasswordLoading());
      await MyFunctions.tryToResetPassword(
          event.login, event.password, event.context);
          emit(ResetPasswordInitial());
    });
  }
}
