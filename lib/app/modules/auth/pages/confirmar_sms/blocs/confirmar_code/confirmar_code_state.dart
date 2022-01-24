import 'package:hera/app/shared/exception/public_message_exception.dart';

abstract class ConfirmarCodeState {}

class ConfirmarCodeInitial implements ConfirmarCodeState {}

class ConfirmarCodeLoading implements ConfirmarCodeState {}

class ConfirmarCodeSucess implements ConfirmarCodeState {}

class ConfirmarCodeFailure implements ConfirmarCodeState {
  final PublicMessageException exception;
  ConfirmarCodeFailure(this.exception);
}