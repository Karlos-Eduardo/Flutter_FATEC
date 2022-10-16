//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage('lib/images/drawer.png')),
            ),
            padding: EdgeInsets.all(0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 42,
                  backgroundImage: AssetImage('lib/images/diego.jpeg'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Gestor',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'gestor@gmail.com',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => {Navigator.of(context).pushNamed('/telaGestor')},
          ),
          ListTile(
            leading: Icon(Icons.pending_actions_sharp),
            title: Text(
              'Histórico',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => {Navigator.of(context).pushNamed('/historico')},
          ),
          ListTile(
            leading: Icon(Icons.forum),
            title: Text(
              'Chat',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => {Navigator.of(context).pushNamed('/chat')},
            trailing: ClipOval(
              child: Container(
                width: 20,
                height: 20,
                color: Colors.red,
                child: Center(child: Text('8')),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.groups),
            title: Text(
              'Equipe',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => {Navigator.of(context).pushNamed('/equipe')},
          ),
          ListTile(
            leading: Icon(Icons.description_sharp),
            title: Text(
              'Relatórios',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => {Navigator.of(context).pushNamed('/relatorios')},
          ),
          Divider(thickness: 1),
          
          /*Expanded(
              child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
          )),*/
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text(
              'Sobre',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => {Navigator.of(context).pushNamed('/sobre')},
          ),
        ],
      ),
    );
  }
}
