import 'package:app_agni/controller/login_controller.dart';
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
  bool isPasswordVisible = false;
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
            const Expanded(child: SizedBox()),
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
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    prefixIcon: const Icon(Icons.key, color: Colors.black),
                    suffixIcon: IconButton(
                        icon: isPasswordVisible
                            ? const Icon(Icons.visibility_off,
                                color: Colors.black)
                            : const Icon(Icons.visibility, color: Colors.black),
                        onPressed: () => setState(
                            () => isPasswordVisible = !isPasswordVisible)),
                    labelText: 'Senha',
                    labelStyle: const TextStyle(color: Colors.black),
                    border: const UnderlineInputBorder(),
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.2,
                        vertical: 10)),
                child: const Text(
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
                              title: const Text('Resumo'),
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
                                    child: const Text('Voltar',
                                        style: TextStyle(color: Colors.black)),
                                    onPressed: () =>
                                        Navigator.of(context).pop()),
                                CupertinoDialogAction(
                                    child: const Text('Confirmar',
                                        style: TextStyle(color: Colors.black)),
                                    onPressed: () {
                                      LoginController().criarConta(
                                          context,
                                          name.text,
                                          email.text,
                                          password.text,
                                          telephone.text);

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
            const Expanded(child: SizedBox()),
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
          //obscureText: isPasswordVisible,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            prefixIcon: Icon(icone, color: Colors.black),
            labelText: label,
            hintText: hintText,
            labelStyle: const TextStyle(color: Colors.black),
            border: const UnderlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
