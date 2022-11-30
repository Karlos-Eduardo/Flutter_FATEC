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
        title: const Text('Sobre o aplicativo',
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Expanded(child: SizedBox()),
            Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                  Radius.circular(100),
                )),
                //
                width: 150,
                height: 150,
                child: Image.asset('lib/images/logom.png')),
            const Expanded(child: SizedBox()),
            Column(
              children: [
                Text(
                  'Gerenciador de Chamados',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    'O aplicativo auxilia o gestor para a tomada de decisão e para gerenciar a equipe técnica responsável. Verificando os status do chamado e o tempo gasto para resolver o problema. O sistema de chamados permite ao gestor manter um controle maior. Oferece, também, indicadores de desempenho (KPls), que podem ser utilizados como métricas para avaliação do departamento, para acompanhamento individual do técnico ou da equipe.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
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
                        const Icon(Icons.link),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            foregroundColor: Colors.blue.shade900,
                          ),
                          onPressed: _launchUrl2,
                          child: const Text('Github'),
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
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text('Karlos Nunes'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.link),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            foregroundColor: Colors.blue.shade900,
                          ),
                          onPressed: _launchUrl1,
                          child: const Text('Github'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
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
