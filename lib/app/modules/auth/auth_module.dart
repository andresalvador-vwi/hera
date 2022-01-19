import 'package:flutter_modular/flutter_modular.dart';
import 'package:hera/app/modules/auth/auth_page.dart';
import 'package:hera/app/modules/auth/pages/login/login_module.dart';

class AuthModule extends Module{

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context,args) => const AuthPage()),
    ChildRoute('/login', child:(context,args) => LoginModule())
  ];
}