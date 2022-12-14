import 'package:app_agni/controller/login_controller.dart';
import 'package:app_agni/models/logo.dart';
import 'package:app_agni/models/util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final emailController = TextEditingController();
  final password = TextEditingController();

  bool isPasswordVisible = true;

  @override
  void initState() {
    super.initState();

    emailController.addListener(() => setState(() {}));
  }

  @override
  //build renderiza a tela
  Widget build(BuildContext context) {
    //Scaffold é um elemento estrutural, adiciona botão,
    //barra de navegação também entrega um menu(drawer)
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
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.98,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 30),
                      child: TextFormField(
                        controller: emailController,
                        cursorColor: Colors.black,
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelText: 'Usuário',
                          labelStyle: const TextStyle(color: Colors.black),
                          hintText: 'exemplo@gmail.com',
                          focusColor: Colors.black,
                          prefixIcon:
                              const Icon(Icons.email, color: Colors.black),
                          suffixIcon: emailController.text.isEmpty
                              ? const SizedBox(
                                  width: 0,
                                  height: 0,
                                )
                              : IconButton(
                                  icon: const Icon(Icons.close,
                                      color: Colors.black),
                                  onPressed: () => emailController.clear()),
                          border: const UnderlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.98,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TextFormField(
                        controller: password,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon:
                              const Icon(Icons.key, color: Colors.black),
                          labelText: 'Senha',
                          suffixIcon: IconButton(
                              icon: isPasswordVisible
                                  ? const Icon(Icons.visibility_off,
                                      color: Colors.black)
                                  : const Icon(Icons.visibility,
                                      color: Colors.black),
                              onPressed: () => setState(() =>
                                  isPasswordVisible = !isPasswordVisible)),
                          labelStyle: const TextStyle(color: Colors.black),
                          border: const UnderlineInputBorder(),
                        ),
                        obscureText: isPasswordVisible,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.2,
                              vertical: 10)),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => LoginController()
                          .login(context, emailController.text, password.text)),
                  TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(color: Colors.black)),
                    child: const Text('CADASTRE-SE',
                        style: TextStyle(color: Colors.black)),
                    onPressed: () => {
                      Navigator.of(context).pushReplacementNamed('/cadastroApp')
                    },
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          foregroundColor: Colors.black),
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed('/cadastroEmpresa');
                      },
                      child: const Text('Contrate um plano'),
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text(
                            "Recuperar senha",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  'Informe seu e-mail',
                                  style: GoogleFonts.roboto(
                                    fontSize: 24,
                                    color: Colors.blueGrey.shade700,
                                  ),
                                ),
                                titlePadding: const EdgeInsets.all(20),
                                content: SizedBox(
                                  width: 350,
                                  height: 80,
                                  child: Column(
                                    children: [
                                      campoTexto2('E-mail', Icons.email,
                                          emailController),
                                    ],
                                  ),
                                ),
                                backgroundColor: Colors.blueGrey.shade50,
                                actionsPadding:
                                    const EdgeInsets.fromLTRB(0, 0, 20, 20),
                                actions: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      minimumSize: const Size(120, 50),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'cancelar',
                                      style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        color: Colors.blueAccent.shade700,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor:
                                          Colors.blueAccent.shade700,
                                      minimumSize: const Size(120, 50),
                                    ),
                                    onPressed: () async {
                                      if (emailController.text.isNotEmpty) {
                                        LoginController().esqueceuSenha(
                                            emailController.text);
                                        sucesso(context,
                                            'E-mail enviado com sucesso.');
                                      } else {
                                        erro(context,
                                            'Informe o e-mail para recuperar a senha.');
                                      }

                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'enviar',
                                      style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
