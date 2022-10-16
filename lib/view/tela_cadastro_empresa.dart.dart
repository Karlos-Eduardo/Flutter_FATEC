//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:app_agni/models/campo_texto.dart';
import 'package:app_agni/models/logo.dart';

import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              logo(150, 150),
              campoTexto('Nome'),
              campoTexto('Empresa'),
              campoTexto('Email'),
              campoTexto('Telefone'),
              campoTexto('Quantidade de usuários'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Color.fromARGB(255, 3, 4, 94),
                          padding:
                              EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.2, vertical: 15)),
                      child: Text(
                        'Enviar',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushReplacementNamed('/')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
