import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hera/app/modules/auth/pages/confirmar_sms/blocs/reenviar_code/reenviar_code_state.dart';
import 'package:hera/app/shared/exception/public_message_exception.dart';

class ReenviarCodeCubit extends Cubit<ReenviarCodeState> {
  ReenviarCodeCubit() : super(ReenviarCodeInitial());

  Future<void> reenviarSms(String code) async {
    try {
      emit(ReenviarCodeLoading());
      await Future.delayed(const Duration(seconds: 3));
      emit(ReenviarCodeSucess());
    } on PublicMessageException catch (e) {
      emit(ReenviarCodeFailure(e));
    }
  }
}