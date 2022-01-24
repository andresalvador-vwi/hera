import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hera/app/modules/auth/pages/envio_sms/cubit/enviar_sms_cubit.dart';
import 'package:hera/app/shared/widgets/default_button.dart';

class EnvioSmspage extends StatefulWidget {
  const EnvioSmspage({Key? key}) : super(key: key);

  @override
  _EnvioSmspageState createState() => _EnvioSmspageState();
}

class _EnvioSmspageState extends State<EnvioSmspage> {

  final enviarSmsCubit = Modular.get<EnviarSmsCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: SizedBox(
          height: 50,
          child: Image.asset('assets/hera.png'),
        ),
        leading: IconButton(
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 16,
              right: 16,
              bottom: 20,
            ),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                    text: 'Olá ',
                    children: [
                      TextSpan(
                          text: 'André,',
                          style: TextStyle(color: Colors.greenAccent[400])),
                      const TextSpan(
                        text: 'fui contratada pela ',
                      ),
                      TextSpan(
                          text: 'Vivaweb,',
                          style: TextStyle(color: Colors.greenAccent[400])),
                      const TextSpan(
                        text: 'para ajudar você em sua jornada de trabalho',
                      ),
                    ])),
          ),
          const Text(
            'Enviaremos um SMS para confirmar seu cadastro.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          BlocConsumer<EnviarSmsCubit, EnviarSmsState>(
            bloc: enviarSmsCubit,
            listener: (context, state) {
              if (state is EnviarSmsSucess) {
                Navigator.pushNamed(context, '/login/confirmarsms');
                return;
              }
              if (state is EnviarSmsFailure) {
                ScaffoldMessenger.of(context)
                  .showSnackBar(
                    SnackBar(
                      content: Text(state.exception.message)
                    )
                );
                return;
              }
            },
            builder: (context, state) {
              return DefaultButtonHera(
                backgroundColor: Colors.greenAccent[400],
                textButton: 'Avançar',
                isLoading: state is EnviarSmsLoading,
                actionButton: () async => enviarSmsCubit.enviarSms()
              );
            },
          )
        ],
      ),
    );
  }
}
