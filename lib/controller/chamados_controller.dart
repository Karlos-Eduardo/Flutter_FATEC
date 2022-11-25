import 'package:app_agni/models/util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChamadosController {
  void criarChamado(context, title, urgency, description) {
    if (title != "" || description != "") {
      FirebaseFirestore.instance.collection('chamados').add({
        "titulo": title,
        "urgencia": urgency,
        "descricao": description,
        'status': '0',
        'uid': FirebaseAuth.instance.currentUser!.uid,
      });

      sucesso(context, 'Chamado enviado com sucesso.');
    } else {
      erro(context, 'Preencha todos os campos');
    }
  }

  listar(status) {
    return FirebaseFirestore.instance
        .collection('chamados')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('status', isEqualTo: status);
  }

  listarHistorico() {
    return FirebaseFirestore.instance
        .collection('chamados')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid);
  }

  void remover(id) {
    FirebaseFirestore.instance.collection('chamados').doc(id).delete();
  }

  void atualizar(id, status) {
    FirebaseFirestore.instance.collection('chamados').doc(id).update(
      {
        'status': status,
      },
    );
  }
}
