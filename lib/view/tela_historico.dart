//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'package:app_agni/models/logo.dart';
import 'package:app_agni/models/build_card.dart';
import 'package:app_agni/models/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaHistorico extends StatefulWidget {
  const TelaHistorico({Key? key}) : super(key: key);

  @override
  State<TelaHistorico> createState() => _TelaHistoricoState();
}

class _TelaHistoricoState extends State<TelaHistorico> {
  final search = TextEditingController();
  String titulo = "titulo";
  String urgencia = "urgencia";

  @override
  Widget build(BuildContext context) {
    double tam = MediaQuery.of(context).size.height / 10;
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(166, 0, 180, 216),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.notifications,
                color: Colors.black,
              ))
        ],
        title: Text(
          'Histórico',
          style: GoogleFonts.roboto(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: TextField(
            controller: search,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusColor: Colors.white,
                suffixIcon: Icon(Icons.search, color: Colors.black87),
                label: Text(
                  'Pesquisa',
                  style: GoogleFonts.roboto(),
                ),
                labelStyle: TextStyle(color: Colors.black87),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(2))),
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.70,
            margin: EdgeInsets.all(15),
            child: ListView(children: [
              buildCard("Computador não liga", "Alta", tam),
              buildCard("Impressora pegando fogo", "Baixa", tam),
              buildCard("Wifi não funciona", "Intermediária", tam),
              buildCard("Projetor não da imagem", "Alta", tam),
              buildCard("Computador não da imagem", "Alta", tam),
              buildCard("Computador sem som", "Baixa", tam),
              buildCard("Computador", "Alta", tam),
              buildCard("Impressora não imprime", "Intermediária", tam),
            ])),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.black)),
    );
  }
}
