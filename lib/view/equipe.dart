//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_agni/models/navigation_drawer.dart';
import 'package:flutter/material.dart';

class TelaEquipe extends StatefulWidget {
  const TelaEquipe({Key? key}) : super(key: key);

  @override
  State<TelaEquipe> createState() => _TelaEquipeState();
}

class _TelaEquipeState extends State<TelaEquipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
          title: const Text('Equipe',style: TextStyle(color: Colors.black),),
          centerTitle: true,
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(Icons.notifications,color: Colors.black,))
          ]),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.10,
            color: const Color.fromARGB(250, 158, 203, 247),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.groups, color: Colors.black, size: 60),
                  Text('Equipe',
                      style: TextStyle(fontSize: 25, color: Colors.black)),
                ]),
          ),
          Expanded(
            child: Container(
                color: Colors.white,
                margin: EdgeInsets.all(2),
                child: ListView(
                  children: [
                    /*ListTile(
                      leading: ClipOval(
                          child: Image.asset('lib/images/perfilmulher.png')),
                      title: Text('Nome'),
                      trailing: Text('Cargo'),
                    ),
                    Divider(
                      thickness: 4,
                    ),*/
                    DataTable(dataRowHeight: 51, columns: [
                      DataColumn(
                        label: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text('Nome'),
                        ),
                      ),
                      DataColumn(
                          label: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text('Usuário'),
                      )),
                    ], rows: [
                      DataRow(cells: [
                        DataCell(Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipOval(
                                child:
                                    Image.asset('lib/images/perfilhomem.png')),
                            Text('Karlos Eduardo')
                          ],
                        )),
                        DataCell(Text('Técnico')),
                      ]),
                    ])
                  ],
                )),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.17,
            //color: Colors.amber,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: EdgeInsets.only(top: 19),
                  child: ElevatedButton(
                    //style: ElevatedButton.styleFrom(
                    // padding: EdgeInsets.only(left: 60)),
                    child: Row(
                      children: [
                        Text(
                          'NOVO COLABORADOR',
                          style: TextStyle(color: Colors.black),
                        ),
                        Spacer(),
                        Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/novoColaborador'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
    );
  }
}
