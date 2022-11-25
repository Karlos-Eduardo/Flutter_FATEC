import 'package:app_agni/controller/chamados_controller.dart';
import 'package:app_agni/view/chamados_exibir_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChamadosCriados extends StatefulWidget {
  const ChamadosCriados({super.key});

  @override
  State<ChamadosCriados> createState() => _ChamadosCriadosState();
}

class _ChamadosCriadosState extends State<ChamadosCriados> {
  var chamados = ChamadosController().listar('0');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          Text(
            'Chamados em aberto',
            style:
                GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          ChamadosExibirController(
            chamados,
            Colors.red,
            const Color.fromARGB(250, 113, 179, 245),
            Icons.start,
            '1',
          ),
        ],
      ),
    );
  }
}
