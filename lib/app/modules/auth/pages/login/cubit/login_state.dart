part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginTextIsEmpty extends LoginState {}

class LoginSucess extends LoginState {}

class LoginFailure extends LoginState {
  final PublicMessageException exception;
  LoginFailure(this.exception);
}
