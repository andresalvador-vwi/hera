part of 'enviar_sms_cubit.dart';

@immutable
abstract class EnviarSmsState {}

class EnviarSmsInitial extends EnviarSmsState {}

class EnviarSmsLoading extends EnviarSmsState {}

class EnviarSmsSucess extends EnviarSmsState {}

class EnviarSmsFailure extends EnviarSmsState {
  final PublicMessageException exception;
  EnviarSmsFailure(this.exception);
}
