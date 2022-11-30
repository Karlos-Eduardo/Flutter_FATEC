import 'package:app_agni/controller/chamados_controller.dart';
import 'package:app_agni/models/util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChamadosExibirController extends StatefulWidget {
  final chamados;
  final cor;
  final cor2;
  final icone;
  final status;

  const ChamadosExibirController(
      this.chamados, this.cor, this.cor2, this.icone, this.status,
      {Key? key})
      : super(key: key);

  @override
  State<ChamadosExibirController> createState() => _ChamadosExibirWidgetState();
}

class _ChamadosExibirWidgetState extends State<ChamadosExibirController> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: StreamBuilder<QuerySnapshot>(
          stream: widget.chamados.snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text('Não foi possível conectar.'),
                );
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                final dados = snapshot.requireData;
                if (dados.size > 0) {
                  return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      dynamic item = dados.docs[index].data();
                      String titulo = item['titulo'];
                      String descricao = item['descricao'];
                      String statusItem = item['status'];
                      String urgencia = item['urgencia'];

                      switch (statusItem) {
                        case '0':
                          statusItem = 'Criado';
                          break;
                        case '1':
                          statusItem = 'Em andamento';
                          break;
                        case '2':
                          statusItem = 'Finalizado';
                          break;
                        default:
                      }

                      return Card(
                          color: widget.cor2,
                          child: ExpansionTile(
                            childrenPadding: const EdgeInsets.all(10),
                            iconColor: Colors.black,
                            textColor: Colors.black,
                            title: ListTile(
                              title: Text(
                                titulo,
                                style: GoogleFonts.roboto(fontSize: 22),
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('Urgência: $urgencia',
                                          style: GoogleFonts.roboto()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: ClipOval(
                                          child: Container(
                                            width: 10,
                                            height: 10,
                                            color: widget.cor,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        statusItem,
                                        style: GoogleFonts.roboto(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: Visibility(
                                visible: widget.status != '3' ? true : false,
                                child: IconButton(
                                  icon: (widget.status == '4')
                                      ? const Icon(Icons.delete)
                                      : Icon(widget.icone),
                                  onPressed: () {
                                    if (widget.status == '4') {
                                      ChamadosController()
                                          .remover(dados.docs[index].id);
                                      sucesso(context,
                                          'Item removido com sucesso.');
                                    } else {
                                      ChamadosController().atualizar(
                                        dados.docs[index].id,
                                        widget.status,
                                      );

                                      setState(() {
                                        widget;
                                      });

                                      sucesso(
                                        context,
                                        'Status atualizado com sucesso.',
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      descricao,
                                      style: GoogleFonts.roboto(fontSize: 18),
                                    ),
                                  ])
                            ],
                          ));
                    },
                  );
                } else {
                  return const Center(
                    child: Text('Nenhum chamado encontrado.'),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
