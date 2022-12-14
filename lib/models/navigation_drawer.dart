import 'dart:io';
import 'package:app_agni/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Falha ao carregar imagem: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage('lib/images/drawer.png')),
            ),
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        image != null
                            ? ClipOval(
                                child: Image.file(
                                image!,
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ))
                            : const CircleAvatar(
                                radius: 42,
                                backgroundImage:
                                    AssetImage('lib/images/defaultUser.png'),
                              ),
                        Padding(
                            padding: const EdgeInsets.only(top: 56, left: 58),
                            child: IconButton(
                              icon: const Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                                size: 15,
                              ),
                              onPressed: () => pickImage(ImageSource.gallery),
                            )),
                      ],
                    ),
                  ],
                ),
                returnNameUser(),
                const SizedBox(
                  height: 2,
                ),
                returnEmailUser()
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => {Navigator.of(context).pushNamed('/telaGestor')},
          ),
          ListTile(
            leading: const Icon(Icons.pending_actions_sharp),
            title: const Text(
              'Hist??rico',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => {Navigator.of(context).pushNamed('/historico')},
          ),
          const Divider(thickness: 1),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text(
              'Sobre',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => {Navigator.of(context).pushNamed('/sobre')},
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text(
              'Sair',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              LoginController().logout();
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
    );
  }
}

returnNameUser() {
  return FutureBuilder<String>(
    future: LoginController().retornarUsuarioLogado(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return const Text('Error');
        } else if (snapshot.hasData) {
          return Text(
            snapshot.data.toString(),
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.roboto(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          );
        } else {
          return const Text('Empty data');
        }
      } else {
        return Text('State: ${snapshot.connectionState}');
      }
    },
  );
}

returnEmailUser() {
  return FutureBuilder(
    future: LoginController().retornarEmailUsuarioLogado(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return const Text('Error');
        } else if (snapshot.hasData) {
          return Text(
            snapshot.data.toString(),
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.roboto(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          );
        } else {
          return const Text('Empty data');
        }
      } else {
        return Text('State: ${snapshot.connectionState}');
      }
    },
  );
}
