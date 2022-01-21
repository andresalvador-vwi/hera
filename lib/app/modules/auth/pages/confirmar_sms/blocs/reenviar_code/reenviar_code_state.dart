import 'package:hera/app/shared/exception/public_message_exception.dart';

abstract class ReenviarCodeState {}

class ReenviarCodeInitial implements ReenviarCodeState {}

class ReenviarCodeLoading implements ReenviarCodeState {}

class ReenviarCodeSucess implements ReenviarCodeState {}

class ReenviarCodeFailure implements ReenviarCodeState {
  final PublicMessageException exception;
  ReenviarCodeFailure(this.exception);
}