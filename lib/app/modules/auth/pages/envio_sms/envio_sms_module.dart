import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hera/app/modules/auth/pages/envio_sms/cubit/enviar_sms_cubit.dart';
import 'package:hera/app/modules/auth/pages/envio_sms/envio_sms_page.dart';

class EnvioSmsModule extends WidgetModule {

  @override
  List<Bind<Object>> get binds => [
    Bind.factory((i) => EnviarSmsCubit())
  ];

  @override
  Widget get view => const EnvioSmspage();
  
}