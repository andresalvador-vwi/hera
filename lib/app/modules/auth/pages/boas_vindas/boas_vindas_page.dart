import 'package:flutter/material.dart';
import 'package:hera/app/modules/auth/pages/confirmar_sms/confirmar_sms_module.dart';
import 'package:hera/app/shared/widgets/default_button.dart';
import 'package:hera/app/shared/widgets/mensagem_hera.dart';

class BoasVindasPage extends StatefulWidget {
  const BoasVindasPage({ Key? key }) : super(key: key);

  @override
  _BoasVindasPageState createState() => _BoasVindasPageState();
}

class _BoasVindasPageState extends State<BoasVindasPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 120,
              child: Center(
                child: Image.asset('assets/hera.png')
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            MensagemHera(
              child: RichText(
                text: const TextSpan(
                  text: 'Oi, eu sou a ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                  ),
                  children: [
                    TextSpan(
                      text: '@hera,',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    TextSpan(
                      text: ' sou uma assistente profissional.',
                    ),
                  ]
                )
              )
            ),
            const SizedBox(
              height: 20,
            ),
            MensagemHera(
              child: RichText(
                text: const TextSpan(
                  text: 'Meu propósito é ajudar você em sua ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                  ),
                  children: [
                    TextSpan(
                      text: 'carreira ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    TextSpan(
                      text: 'profissional através da tecnologia.',
                    ),
                  ]
                )
              )
            ),
            const SizedBox(
              height: 20,
            ),
            MensagemHera(
              child: RichText(
                text: const TextSpan(
                  text: 'Vamos ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                  ),
                  children: [
                    TextSpan(
                      text: 'começar?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ]
                )
              )
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: DefaultButton(
                textButton: 'Começar',
                backgroundColor: Colors.greenAccent[400],
                actionButton: () {
                  Navigator.pushNamed(context,'/enviosms');
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}