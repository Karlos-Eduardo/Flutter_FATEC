//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'package:app_agni/view/fotos_page.dart';
import 'dart:io';

import 'package:app_agni/controller/colaborador_controller.dart';
import 'package:app_agni/models/build_textformfield.dart';
import 'package:app_agni/models/navigation_drawer.dart';
import 'package:app_agni/models/text_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class TelaNovoColaborador extends StatefulWidget {
  const TelaNovoColaborador({Key? key}) : super(key: key);

  @override
  State<TelaNovoColaborador> createState() => _TelaNovoColaboradorState();
}

class _TelaNovoColaboradorState extends State<TelaNovoColaborador> {
  List<String> items = ['Colaborador', 'Técnico'];
  String? selectedItem = 'Colaborador';
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final loading = ValueNotifier<bool>(false);

  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        loading.value = !loading.value;
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Falha ao carregar imagem: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
          title: const Text(
            'Colaborador',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.notifications,
                  color: Colors.black,
                ))
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.10,
              color: Color.fromARGB(250, 113, 179, 245),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Adicionar Colaborador',
                      style: TextStyle(fontSize: 25),
                    ),
                  ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.78 + 26,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTextFormField('Nome', name),
                  buildTextFormField('E-mail', email),
                  buildTextFormField('Senha', password),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(children: [
                          Text('Foto',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                          Container(
                              height: MediaQuery.of(context).size.height / 4,
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: AnimatedBuilder(
                                  animation: loading,
                                  builder: (context, _) {
                                    return loading.value
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 40,
                                                height: 40,
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              image != null
                                                  ? Image.file(
                                                      image!,
                                                      width: 205,
                                                      height: 208.5,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Icon(
                                                      Icons.photo,
                                                      size: 40,
                                                    )
                                            ],
                                          );
                                  })),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    loading.value = !loading.value;
                                    pickImage(ImageSource.gallery);
                                  },
                                  icon: Icon(Icons.image_outlined)),
                              IconButton(
                                  onPressed: () {
                                    loading.value = !loading.value;
                                    pickImage(ImageSource.camera);
                                  },
                                  icon: Icon(Icons.camera_alt_outlined)),
                            ],
                          )
                        ]),
                        Column(children: [
                          Text('Tipo de usuário',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 6, 0, 0),
                                  fontSize: 15)),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 6),
                            child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  focusColor: Colors.black87,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black87)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black87)),
                                ),
                                iconSize: 24,
                                dropdownColor: Colors.white,
                                iconEnabledColor: Color.fromARGB(255, 0, 0, 0),
                                hint: Text('Selecione'),
                                value: selectedItem,
                                items: items
                                    .map((item) => DropdownMenuItem<String>(
                                        value: item, child: Text(item)))
                                    .toList(),
                                onChanged: (item) =>
                                    setState(() => selectedItem = item)),
                          ),
                        ])
                      ],
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Cadastrar',
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                    onPressed: () {
                      showCupertinoDialog(
                          context: context,
                          builder: (_) => CupertinoAlertDialog(
                                  title: Text('Resumo'),
                                  content: Column(
                                    children: [
                                      textAlert('Nome', name),
                                      textAlert('E-mail', email),
                                      textAlert('Senha', password),
                                      textAlert('Função', selectedItem, aux: 1),
                                    ],
                                  ),
                                  actions: [
                                    CupertinoDialogAction(
                                        child: Text('Voltar',
                                            style:
                                                TextStyle(color: Colors.black)),
                                        onPressed: () =>
                                            Navigator.of(context).pop()),
                                    CupertinoDialogAction(
                                        child: Text('Confirmar',
                                            style:
                                                TextStyle(color: Colors.black)),
                                        onPressed: () {
                                          ColaboradorController()
                                              .novoColaborador(context, name.text,
                                                  email.text, password.text,selectedItem);
                                          Navigator.of(context).pop();
                                          name.clear();
                                          email.clear();
                                          password.clear();
                                          setState(() => image = null);
                                        }),
                                  ]),
                          barrierDismissible: false);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
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
