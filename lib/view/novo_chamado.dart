//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
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
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
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
            color: Color.fromARGB(250, 158, 203, 247),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
            height: MediaQuery.of(context).size.height * 0.78,
            child: Column(
              children: [
                //buildTextFormField('Título', title),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLength: 40,
                    maxLines: null,
                    controller: title,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)),
                      labelText: 'Título',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: const TextStyle(color: Colors.black),
                      focusColor: Colors.white,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          label: Text(
                            'Urgência',
                            style: TextStyle(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87)),
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black45),
                              borderRadius: BorderRadius.circular(5))),
                      isExpanded: true,
                      iconSize: 24,
                      dropdownColor: Colors.white,
                      //focusColor: Colors.black87,
                      iconEnabledColor: Color.fromARGB(255, 0, 0, 0),
                      hint: Text('Selecione'),
                      value: selectedItem,
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                              value: item, child: Text(item)))
                          .toList(),
                      onChanged: (item) => setState(() => selectedItem = item)),
                ),
                Spacer(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Descrição',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextField(
                    controller: description,
                    maxLines: null,
                    style: TextStyle(fontSize: 20),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
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
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text(
                        'Enviar',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        showCupertinoDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                                    title: Text('Resumo'),
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
                                          child: Text('Voltar',
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          onPressed: () =>
                                              Navigator.of(context).pop()),
                                      CupertinoDialogAction(
                                          child: Text('Confirmar',
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          onPressed: () {
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
                Spacer(),
              ],
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          )),
    );
  }
}
