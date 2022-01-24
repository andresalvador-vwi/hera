import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hera/app/modules/auth/pages/confirmar_sms/blocs/confirmar_code/confirmar_code_state.dart';
import 'package:hera/app/shared/exception/public_message_exception.dart';

class ConfirmarCodeCubit extends Cubit<ConfirmarCodeState> {
  
  ConfirmarCodeCubit() : super(ConfirmarCodeInitial());

  String currentCode = '';

  Future<void> onChanged(String value) async => currentCode = value;

  Future<void> confirmarSms(String code) async {
    try {
      emit(ConfirmarCodeLoading());
      await Future.delayed(const Duration(seconds: 3));
      emit(ConfirmarCodeSucess());
    } on PublicMessageException catch (e) {
      emit(ConfirmarCodeFailure(e));
    }
  }
  
}