//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'package:app_agni/models/logo.dart';
import 'package:app_agni/models/navigation_drawer.dart';
import 'package:flutter/material.dart';

class TelaHistorico extends StatefulWidget {
  const TelaHistorico({Key? key}) : super(key: key);

  @override
  State<TelaHistorico> createState() => _TelaHistoricoState();
}

class _TelaHistoricoState extends State<TelaHistorico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(166, 0, 180, 216),
        actions: <Widget>[
          Padding(padding: EdgeInsets.only(right: 15), child: Icon(Icons.notifications,color: Colors.black,))
        ],
        title: Text('Histórico', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusColor: Colors.white,
                suffixIcon: Icon(Icons.search, color: Colors.black87),
                label: Text('Pesquisa'),
                labelStyle: TextStyle(color: Colors.black87),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(2))),
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.75,
            color: Colors.white,
            margin: EdgeInsets.all(15),
            child: ListView(children: [
              for (var i in [
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                ''
              ])
                ListTile(
                  leading: Icon(Icons.messenger_outline_sharp),
                  title: Text(i),
                  onTap: () {},
                ),
            ])),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.black)),
    );
  }
}
