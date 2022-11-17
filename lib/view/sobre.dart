// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'package:app_agni/models/logo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url1 = Uri.parse('https://github.com/Karlos-Eduardo');
final Uri _url2 = Uri.parse('https://github.com/Diego-Moretti');

class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Sobre o aplicativo', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(child: SizedBox()),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                  Radius.circular(100),
                )),
                //
                width: 150,
                height: 150,
                child: Image.asset('lib/images/logom.png')),
            Expanded(child: SizedBox()),
            Column(
              children: [
                Text(
                  'Gerenciador de Chamados',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'O aplicativo auxilia o gestor para a tomada de decisão e para gerenciar a equipe técnica responsável. Verificando os status do chamado e o tempo gasto para resolver o problema. O sistema de chamados permite ao gestor manter um controle maior. Oferece, também, indicadores de desempenho (KPls), que podem ser utilizados como métricas para avaliação do departamento, para acompanhamento individual do técnico ou da equipe.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    ClipOval(
                        child: Image.asset(
                      'lib/images/diego.jpeg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Diego Moretti',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.link),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(fontWeight: FontWeight.bold),
                            foregroundColor: Colors.blue.shade900,
                          ),
                          onPressed: _launchUrl2,
                          child: Text('Github'),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    ClipOval(
                        child: Image.asset(
                      'lib/images/karlos.jpeg',
                      width: 100,
                      height: 100,
                    )),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('Karlos Nunes'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.link),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(fontWeight: FontWeight.bold),
                            foregroundColor: Colors.blue.shade900,
                          ),
                          onPressed: _launchUrl1,
                          child: Text('Github'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Expanded(child: SizedBox()),
          ]),
        ),
      ),
    );
  }
}

Future<void> _launchUrl1() async {
  if (!await launchUrl(_url1)) {
    throw 'Could not launch $_url1';
  }
}

Future<void> _launchUrl2() async {
  if (!await launchUrl(_url2)) {
    throw 'Could not launch $_url2';
  }
}
