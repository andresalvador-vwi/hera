import 'package:bloc/bloc.dart';
import 'package:hera/app/shared/exception/public_message_exception.dart';
import 'package:meta/meta.dart';

part 'enviar_sms_state.dart';

class EnviarSmsCubit extends Cubit<EnviarSmsState> {
  EnviarSmsCubit() : super(EnviarSmsInitial());

  Future<void> enviarSms() async {
    try {
      emit(EnviarSmsLoading());
      await Future.delayed( const Duration(seconds: 3));
      emit(EnviarSmsSucess());
    } on PublicMessageException catch (e) {
      emit(EnviarSmsFailure(e));
    }
  }
}
