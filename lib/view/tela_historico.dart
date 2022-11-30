import 'package:app_agni/controller/chamados_controller.dart';
import 'package:app_agni/models/navigation_drawer.dart';
import 'package:app_agni/view/chamados_exibir_widget.dart';
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

  //Lista retornada do firebase
  var chamados = ChamadosController().listarHistorico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(166, 0, 180, 216),
        actions: const <Widget>[
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
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusColor: Colors.white,
                suffixIcon: const Icon(Icons.search, color: Colors.black87),
                label: Text(
                  'Pesquisa',
                  style: GoogleFonts.roboto(),
                ),
                labelStyle: const TextStyle(color: Colors.black87),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(2))),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.70 - 16,
          margin: const EdgeInsets.all(15),
          child:
              //
              // EXIBIR TAREFAS
              //
              ChamadosExibirController(
            chamados,
            const Color.fromARGB(250, 113, 179, 245),
            const Color.fromARGB(250, 113, 179, 245),
            Icons.delete,
            '4',
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
    );
  }
}
