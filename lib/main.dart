// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_agni/view/cadastro_app.dart';
import 'package:app_agni/view/novo_chamado.dart';
import 'package:app_agni/view/chat.dart';
import 'package:app_agni/view/novo_colaborador.dart';
import 'package:app_agni/view/sobre.dart';
import 'package:app_agni/view/tela_cadastro_empresa.dart.dart';
import 'package:app_agni/view/tela_gestor.dart';
import 'package:app_agni/view/tela_login.dart';
import 'package:app_agni/view/tela_historico.dart';
import 'package:app_agni/view/equipe.dart';
import 'package:app_agni/view/relatorios.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(
    MaterialApp(
      //definir a tela que será carregada
      //primeiramente durante a execução
      debugShowCheckedModeBanner: false,
      title: 'AGNI',
      theme: ThemeData(
          //textTheme: TextTheme(bodyText1: TextStyle(color: Colors.amber)),
          primaryColor: Color.fromARGB(250, 158, 203, 247),
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 16, color: Colors.black),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) => Color.fromARGB(250, 113, 179, 245)))),
          appBarTheme: AppBarTheme(color: Color.fromARGB(166, 0, 180, 216))),

      initialRoute: '/',
      routes: {
        '/': (context) => TelaLogin(),
        '/cadastroApp': (context) => CadastroApp(),
        '/cadastroEmpresa': (context) => TelaCadastro(),
        '/telaGestor': (context) => TelaGestor(),
        '/sobre': (context) => Sobre(),
        '/historico': (context) => TelaHistorico(),
        '/relatorios': (context) => TelaRelatorios(),
        '/equipe': (context) => TelaEquipe(),
        '/chamado': (context) => NovoChamado(),
        '/chat': (context) => TelaChat(),
        '/novoColaborador': (context) => TelaNovoColaborador(),
      },
    ),
  );
}
