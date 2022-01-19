import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hera/app/modules/auth/pages/confirmar_sms/blocs/confirmar_code/confirmar_code_cubit.dart';
import 'package:hera/app/modules/auth/pages/confirmar_sms/blocs/confirmar_code/confirmar_code_state.dart';
import 'package:hera/app/modules/auth/pages/confirmar_sms/confirmar_sms_module.dart';
import 'package:hera/app/modules/auth/pages/login/blocs/login_button/login_button_cubit.dart';
import 'package:hera/app/modules/auth/pages/login/blocs/login_button/login_button_state.dart';
import 'package:hera/app/shared/widgets/default_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginButtonCubit = Modular.get<LoginButtonCubit>();

  @override
  void dispose() {
    loginButtonCubit.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
/*           BlocConsumer<LoginButtonCubit,LoginButtonState>(
            bloc: loginButtonCubit,
            buildWhen: (previous, current) => current is LoginButtonFailure,
            builder: (context,state) {
              if (state is LoginButtonFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.exception.message)
                  )
                );
              }
              return const SizedBox.shrink();
            },
            listenWhen: (previous, current) => current is LoginButtonSucess,
            listener: (context,state) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ConfirmarSmsModule())
              );
            },
          ), */
          BlocBuilder<LoginButtonCubit,LoginButtonState>(
            bloc: loginButtonCubit,
            buildWhen: (previos,state){
              if (state is LoginButtonSucess) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => ConfirmarSmsModule())
                );
              }
              if (state is LoginButtonFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.exception.message)
                  )
                );
              }
              return true;
            },
            builder: (context,state) {
              return Center(
                child: DefaultButton(
                  textButton: 'Avançar',
                  isLoading: state is LoginButtonLoading ? true : false,
                  actionButton: () async => loginButtonCubit.login()
                ),
              );
            }
          )
        ],
      ),
    );
  }
}