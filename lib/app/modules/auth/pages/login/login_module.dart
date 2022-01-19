import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hera/app/modules/auth/pages/login/blocs/login_button/login_button_cubit.dart';
import 'package:hera/app/modules/auth/pages/login/login_page.dart';

class LoginModule extends WidgetModule {

  @override
  List<Bind<Object>> get binds => [
    Bind.factory((i) => LoginButtonCubit()),
  ];

  @override
  Widget get view => const LoginPage();
  
}