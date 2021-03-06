import 'package:flutter_modular/flutter_modular.dart';
import 'package:hera/app/modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: AuthModule()),
  ];
}