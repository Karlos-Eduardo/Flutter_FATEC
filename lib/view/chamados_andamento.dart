import 'package:app_agni/controller/chamados_controller.dart';
import 'package:app_agni/view/chamados_exibir_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChamadosEmAndamento extends StatefulWidget {
  const ChamadosEmAndamento({super.key});

  @override
  State<ChamadosEmAndamento> createState() => _ChamadosEmAndamentoState();
}

class _ChamadosEmAndamentoState extends State<ChamadosEmAndamento> {
  var chamados = ChamadosController().listar('1');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          Text(
            'Chamados em andamento',
            style:
                GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          ChamadosExibirController(
            chamados,
            Colors.yellow,
            const Color.fromARGB(250, 113, 179, 245),
            Icons.done,
            '2',
          ),
        ],
      ),
    );
  }
}
