import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hera/app/shared/exception/public_message_exception.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(String login) async {
    if (login.isEmpty) return emit(LoginTextIsEmpty());
    try {
      emit(LoginLoading());
      await Future.delayed( const Duration(seconds: 3));
      emit(LoginSucess());
    } on PublicMessageException catch (e) {
      emit(LoginFailure(e));
    }
  }
}
