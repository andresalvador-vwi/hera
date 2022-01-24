import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hera/app/modules/auth/pages/login/cubit/login_cubit.dart';
import 'package:hera/app/shared/widgets/default_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textEditingController = TextEditingController();

  final loginCubit = Modular.get<LoginCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: Center(child: Image.asset('assets/hera.png')),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Seja bem-vindo(a)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'A empresa onde trabalha registrou seu número de celular com ddd ou e-mail',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            BlocBuilder<LoginCubit, LoginState>(
              bloc: loginCubit,
              builder: (context, state) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      width: state is LoginTextIsEmpty ? 1 : 0.2,
                      color: state is LoginTextIsEmpty ? Colors.red : Colors.black
                    )
                  ),
                  child: TextFormField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 15),
                      hintText: 'Digite seu e-mail ou celular com ddd',
                      prefixIcon: Icon(Icons.phone_android)
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            BlocConsumer<LoginCubit, LoginState>(
              bloc: loginCubit,
              listener: (context, state) {
                if (state is LoginSucess) {
                  Navigator.pushNamed(context, '/login/enviosms');
                  return;
                }
                if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.exception.message)));
                  return;
                }
                if (state is LoginTextIsEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Campo não pode ser vazio')));
                  return;
                }
              },
              builder: (context, state) {
                return DefaultButtonHera(
                    textButton: 'Avançar',
                    width: 350,
                    height: 60,
                    isLoading: state is LoginLoading,
                    backgroundColor: Colors.greenAccent[400],
                    actionButton: () async =>
                        loginCubit.login(textEditingController.text));
              },
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Dificuldade de acesso ?'),
          ],
        ),
      ),
    );
  }
}
