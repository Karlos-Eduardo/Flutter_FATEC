import 'package:app_agni/controller/chamados_controller.dart';
import 'package:app_agni/models/navigation_drawer.dart';
import 'package:app_agni/view/chamados_criados.dart';
import 'package:app_agni/view/chamados_andamento.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  var chamados = ChamadosController().listar('0');

  // Telas de Navegecao
  final List<Widget> telas = [
    const ChamadosCriados(),
    const ChamadosEmAndamento()
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.only(top: 30),
              child: Image.asset(
                'lib/images/home.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
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
              margin: const EdgeInsets.only(bottom: 20, top: 25),
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
                        icon: const Icon(
                          Icons.add,
                          size: 60,
                          color: Colors.black,
                        ),
                        label: const Text(''))
                  ]),
            ),
            telas[index]
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          iconSize: 40,
          onTap: (idx) {
            setState(() {
              index = idx;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.keyboard_arrow_left_rounded), label: 'CRIADO'),
            BottomNavigationBarItem(
                icon: Icon(Icons.keyboard_arrow_right_rounded),
                label: 'EM ANDAMENTO')
          ]),
    );
  }
}
