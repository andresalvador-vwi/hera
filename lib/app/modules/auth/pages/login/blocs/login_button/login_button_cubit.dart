import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hera/app/modules/auth/pages/login/blocs/login_button/login_button_state.dart';
import 'package:hera/app/shared/exception/public_message_exception.dart';

class LoginButtonCubit extends Cubit<LoginButtonState> {
  LoginButtonCubit() : super(LoginButtonInitial());
  
  Future<void> login() async {
    try {
      emit(LoginButtonLoading());
      await Future.delayed( const Duration(seconds: 5));
      emit(LoginButtonSucess());
    } on PublicMessageException catch (e) {
      emit(LoginButtonFailure(exception: e));
    }
  }
}