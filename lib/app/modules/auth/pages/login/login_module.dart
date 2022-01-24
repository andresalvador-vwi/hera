import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hera/app/modules/auth/pages/login/cubit/login_cubit.dart';
import 'package:hera/app/modules/auth/pages/login/login_page.dart';

class LoginModule extends WidgetModule {

  @override
  List<Bind<Object>> get binds => [
    Bind.factory((i) => LoginCubit())
  ];

  @override
  Widget get view => const LoginPage();
  
}