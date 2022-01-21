import 'package:flutter/material.dart';

class EnvioSmsPage extends StatefulWidget {
  const EnvioSmsPage({ Key? key }) : super(key: key);

  @override
  _EnvioSmsPageState createState() => _EnvioSmsPageState();
}

class _EnvioSmsPageState extends State<EnvioSmsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: Center(
                child: Image.asset('assets/hera.png')
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15
              ),
              child: Text(
                'Sejá bem-vindo(a)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
            ),
            const Text('A empresa onde trabalha registrou seu número de celular com ddd ou e-mail')
          ],
        ),
      ),
    );
  }
}