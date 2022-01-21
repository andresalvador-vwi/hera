
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hera/app/modules/auth/pages/confirmar_sms/blocs/confirmar_code/confirmar_code_cubit.dart';
import 'package:hera/app/modules/auth/pages/confirmar_sms/blocs/reenviar_code/reenviar_code_cubit.dart';
import 'package:hera/app/modules/auth/pages/confirmar_sms/confirmar_sms_page.dart';

class ConfirmarSmsModule extends WidgetModule {
  
  @override
  List<Bind<Object>> get binds => [
    Bind.factory((i) => ConfirmarCodeCubit()),
    Bind.factory((i) => ReenviarCodeCubit()),
  ];

  @override
  Widget get view => const ConfirmarSmsPage();
  
}