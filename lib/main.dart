import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:app_agni/view/cadastro_app.dart';
import 'package:app_agni/view/novo_chamado.dart';
import 'package:app_agni/view/sobre.dart';
import 'package:app_agni/view/tela_principal.dart';
import 'package:app_agni/view/tela_login.dart';
import 'package:app_agni/view/tela_historico.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  //Evita o erro de inicialização no android
  WidgetsFlutterBinding.ensureInitialized();
  //
  // INICIALIZAÇÃO DO FIREBASE
  //
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      //definir a tela que será carregada
      //primeiramente durante a execução
      debugShowCheckedModeBanner: false,
      title: 'AGNI',
      theme: ThemeData(
          primaryColor: const Color.fromARGB(250, 158, 203, 247),
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          textTheme: const TextTheme(
            bodyText1: TextStyle(fontSize: 16, color: Colors.black),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) => const Color.fromARGB(250, 113, 179, 245)))),
          appBarTheme:
              const AppBarTheme(color: Color.fromARGB(166, 0, 180, 216))),

      initialRoute: '/',
      routes: {
        '/': (context) => const TelaLogin(),
        '/cadastroApp': (context) => const CadastroApp(),
        '/telaGestor': (context) => const TelaPrincipal(),
        '/sobre': (context) => const Sobre(),
        '/historico': (context) => const TelaHistorico(),
        '/chamado': (context) => const NovoChamado(),
      },
    ),
  );
}
