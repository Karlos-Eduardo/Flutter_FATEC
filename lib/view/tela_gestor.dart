//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_agni/controller/chamados_controller.dart';
import 'package:app_agni/models/navigation_drawer.dart';
import 'package:app_agni/view/chamados_exibir_widget.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class TelaGestor extends StatefulWidget {
  const TelaGestor({Key? key}) : super(key: key);

  @override
  State<TelaGestor> createState() => _TelaGestorState();
}

class _TelaGestorState extends State<TelaGestor> {
  var chamados = ChamadosController().listar('0');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.notifications,
                color: Colors.black,
              ))
        ],
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.only(top: 30),
              child: Image.asset(
                'lib/images/home.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                textAlign: TextAlign.center,
                'Leva a sua equipe ao sucesso e mantém sua empresa em sincronia',
                style: GoogleFonts.roboto(
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.20,
              margin: EdgeInsets.only(bottom: 80, top: 100),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Novo chamado',
                      style: GoogleFonts.roboto(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton.icon(
                        onPressed: () =>
                            {Navigator.of(context).pushNamed('/chamado')},
                        icon: Icon(
                          Icons.add,
                          size: 60,
                          color: Colors.black,
                        ),
                        label: Text(''))
                  ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              
              child: ChamadosExibirController(
                chamados,
                Color.fromARGB(250, 113, 179, 245),
                Icons.delete,
                '0',
              ),
            )
          ],
        ),
      ),
    );
  }
}
