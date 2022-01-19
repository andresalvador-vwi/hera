import 'package:hera/app/shared/exception/public_message_exception.dart';

abstract class LoginButtonState {}

class LoginButtonInitial implements LoginButtonState{}

class LoginButtonLoading implements LoginButtonState{}

class LoginButtonSucess implements LoginButtonState {}

class LoginButtonFailure implements LoginButtonState {
  final PublicMessageException exception;
  LoginButtonFailure({
    required this.exception,
  });
}
 