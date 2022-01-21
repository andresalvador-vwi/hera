import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hera/app/modules/auth/pages/envio_sms/envio_sms_page.dart';

class EnvioSmsModule extends WidgetModule {

  @override
  List<Bind<Object>> get binds => [];

  @override
  Widget get view => const EnvioSmsPage();
  
}