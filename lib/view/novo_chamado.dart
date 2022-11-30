import 'package:app_agni/controller/chamados_controller.dart';
import 'package:app_agni/models/build_textformfield.dart';
import 'package:app_agni/models/navigation_drawer.dart';
import 'package:app_agni/models/text_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NovoChamado extends StatefulWidget {
  const NovoChamado({Key? key}) : super(key: key);
  @override
  State<NovoChamado> createState() => _NovoChamadoState();
}

class _NovoChamadoState extends State<NovoChamado> {
  List<String> items = ['Baixa', 'Intermediária', 'Alta'];
  String? selectedItem = 'Baixa';
  final title = TextEditingController();
  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text(
          'Chamado',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.10,
            color: const Color.fromARGB(250, 158, 203, 247),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Novo chamado',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ]),
          ),
          Container(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.78 + 35,
            child: Column(
              children: [
                buildTextFormField('Título', title,
                    flotLabel: true, maxLength: true),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          label: const Text(
                            'Urgência',
                            style: TextStyle(color: Colors.black),
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87)),
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black45),
                              borderRadius: BorderRadius.circular(5))),
                      isExpanded: true,
                      iconSize: 24,
                      dropdownColor: Colors.white,
                      iconEnabledColor: const Color.fromARGB(255, 0, 0, 0),
                      hint: const Text('Selecione'),
                      value: selectedItem,
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                              value: item, child: Text(item)))
                          .toList(),
                      onChanged: (item) => setState(() => selectedItem = item)),
                ),
                const Spacer(),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Descrição',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: TextField(
                    controller: description,
                    maxLines: null,
                    style: const TextStyle(fontSize: 20),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusColor: Colors.black,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: const Text(
                        'Enviar',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        showCupertinoDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                                    title: const Text('Resumo'),
                                    content: Column(
                                      children: [
                                        textAlert('Título', title),
                                        textAlert('Urgência', selectedItem,
                                            aux: 1),
                                        textAlert('Descrição', description),
                                      ],
                                    ),
                                    actions: [
                                      CupertinoDialogAction(
                                          child: const Text('Voltar',
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          onPressed: () =>
                                              Navigator.of(context).pop()),
                                      CupertinoDialogAction(
                                          child: const Text('Confirmar',
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          onPressed: () {
                                            ChamadosController().criarChamado(
                                                context,
                                                title.text,
                                                selectedItem,
                                                description.text);
                                            Navigator.of(context).pop();
                                            title.clear();
                                            description.clear();
                                          }),
                                    ]),
                            barrierDismissible: false);
                      },
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          )),
    );
  }
}
