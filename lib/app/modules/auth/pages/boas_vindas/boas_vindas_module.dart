import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hera/app/modules/auth/pages/boas_vindas/boas_vindas_page.dart';

class BoasVindasModule extends WidgetModule {

  @override
  List<Bind<Object>> get binds => [];

  @override
  Widget get view => const BoasVindasPage();
  
}