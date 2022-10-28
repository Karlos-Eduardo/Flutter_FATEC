//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_agni/models/logo.dart';
import 'package:app_agni/models/text_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastroApp extends StatefulWidget {
  const CadastroApp({Key? key}) : super(key: key);

  @override
  State<CadastroApp> createState() => _CadastroAppState();
}

class _CadastroAppState extends State<CadastroApp> {
  bool isPasswordVisible = true;
  final name = TextEditingController();
  final telephone = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            logo(150, 150),
            Container(
              height: 50,
            ),
            campoTextoCadastro(name, 'Nome', Icons.badge, keyboardType: null),
            campoTextoCadastro(telephone, 'Telefone', Icons.contact_phone,
                hintText: '(DDD)9999-9999', keyboardType: 'phone'),
            campoTextoCadastro(email, 'E-mail', Icons.email,
                hintText: 'exemplo@gmail.com'),
            SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextFormField(
                  controller: password,
                  cursorColor: Colors.black,
                  obscureText: isPasswordVisible,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    prefixIcon: Icon(Icons.key, color: Colors.black),
                    suffixIcon: IconButton(
                        icon: isPasswordVisible
                            ? Icon(Icons.visibility_off, color: Colors.black)
                            : Icon(Icons.visibility, color: Colors.black),
                        onPressed: () => setState(
                            () => isPasswordVisible = !isPasswordVisible)),
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.2,
                        vertical: 10)),
                child: Text(
                  'Cadastrar',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (_) => CupertinoAlertDialog(
                              title: Text('Resumo'),
                              content: Column(
                                children: [
                                  textAlert('Nome', name),
                                  textAlert('Telefone', telephone),
                                  textAlert('E-mail', email),
                                  textAlert('Senha', password),
                                ],
                              ),
                              actions: [
                                CupertinoDialogAction(
                                    child: Text('Voltar',
                                        style: TextStyle(color: Colors.black)),
                                    onPressed: () =>
                                        Navigator.of(context).pop()),
                                CupertinoDialogAction(
                                    child: Text('Confirmar',
                                        style: TextStyle(color: Colors.black)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      name.clear();
                                      telephone.clear();
                                      email.clear();
                                      password.clear();
                                      Navigator.of(context)
                                          .pushReplacementNamed('/');
                                    }),
                              ]),
                      barrierDismissible: false);
                }),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    ));
  }

  campoTextoCadastro(variable, label, icone, {hintText = '', keyboardType}) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextFormField(
          controller: variable,
          keyboardType: (keyboardType == 'phone')
              ? TextInputType.phone
              : TextInputType.text,
          cursorColor: Colors.black,
          obscureText: isPasswordVisible,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            prefixIcon: Icon(icone, color: Colors.black),
            labelText: label,
            hintText: hintText,
            labelStyle: TextStyle(color: Colors.black),
            border: UnderlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
