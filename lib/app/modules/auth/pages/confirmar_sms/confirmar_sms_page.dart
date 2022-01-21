import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hera/app/modules/auth/pages/confirmar_sms/blocs/confirmar_code/confirmar_code_cubit.dart';
import 'package:hera/app/modules/auth/pages/confirmar_sms/blocs/confirmar_code/confirmar_code_state.dart';
import 'package:hera/app/modules/auth/pages/confirmar_sms/blocs/reenviar_code/reenviar_code_cubit.dart';
import 'package:hera/app/modules/auth/pages/confirmar_sms/blocs/reenviar_code/reenviar_code_state.dart';
import 'package:hera/app/shared/widgets/default_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmarSmsPage extends StatefulWidget {
  const ConfirmarSmsPage({ Key? key }) : super(key: key);

  @override
  _ConfirmarSmsPageState createState() => _ConfirmarSmsPageState();
}

class _ConfirmarSmsPageState extends State<ConfirmarSmsPage> {
  
  TextEditingController textEditingController = TextEditingController(); 
  String currentText = "";

  final confirmarCodeCubit = Modular.get<ConfirmarCodeCubit>();
  final reenviarCodeCubit = Modular.get<ReenviarCodeCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Form(
              key: widget.key,
              child: PinCodeTextField(
                autoFocus: true,
                keyboardType: TextInputType.number,
                appContext: context, 
                length: 4,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 60,
                  fieldWidth: 50,
                  borderWidth: 1,
                  inactiveColor: Colors.indigo[900]
                ),
                controller: textEditingController,
                onChanged: (value) => confirmarCodeCubit.onChanged(value),
                // onCompleted: (value) => validate(),
                animationType: AnimationType.fade,
                beforeTextPaste: (text){
                  showDialog(
                    context: context, 
                    builder: (_) => AlertDialog(
                      title: const Text('Colar código'),
                      content: Text('Deseja colar esse código ? $text'),
                      actions: [
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          }, 
                          child: const Text('Cancelar',style: TextStyle(color: Colors.red))
                        ),
                        TextButton(
                          onPressed: (){
                            textEditingController.text = text!;
                            Navigator.of(context).pop();
                          }, 
                          child: const Text('Colar')
                        )
                      ],
                    )
                  );
                  return false;
                },
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),

          BlocBuilder<ConfirmarCodeCubit,ConfirmarCodeState>(
            bloc: confirmarCodeCubit,
            builder: (context,state) {
              return DefaultButton(
                textButton: 'Avançar',
                isLoading: state is ConfirmarCodeLoading ? true : false,
                actionButton: () async => confirmarCodeCubit.confirmarSms(confirmarCodeCubit.currentCode)
              );
            }
          ),
          const SizedBox(
            height: 20,
          ),
          BlocConsumer<ReenviarCodeCubit,ReenviarCodeState>(
            bloc: reenviarCodeCubit,
            listener: (context,state){
              if (state is ReenviarCodeSucess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Código reenviado com sucesso'),
                ));
              }
            },
            builder: (context,state) {
              return DefaultButton(
                textButton: 'Enviar novamente',
                backgroundColor: Colors.red,
                isLoading: state is ReenviarCodeLoading,
                actionButton: () async => reenviarCodeCubit.reenviarSms(confirmarCodeCubit.currentCode)
              );
            }
          ),
        ],
      ),
    );
  }
}