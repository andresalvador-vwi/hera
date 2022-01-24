import 'package:flutter_modular/flutter_modular.dart';
import 'package:hera/app/modules/auth/auth_page.dart';
import 'package:hera/app/modules/auth/pages/boas_vindas/boas_vindas_module.dart';
import 'package:hera/app/modules/auth/pages/confirmar_sms/confirmar_sms_module.dart';
import 'package:hera/app/modules/auth/pages/envio_sms/envio_sms_module.dart';
import 'package:hera/app/modules/auth/pages/login/login_module.dart';


class AuthModule extends Module{

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context,args) => const AuthPage()),
    ChildRoute('/boasvindas', child:(context,args) => BoasVindasModule()),
    ChildRoute('/login', child:(context,args) => LoginModule()),
    ChildRoute('/login/enviosms', child:(context,args) => EnvioSmsModule()),
    ChildRoute('/login/confirmarsms', child:(context,args) => ConfirmarSmsModule()),
  ];
}