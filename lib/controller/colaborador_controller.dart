import 'package:app_agni/models/util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ColaboradorController {
  void novoColaborador(context, name, email, password, userType) {
    if (name != "" || email != "" || password != "") {
      FirebaseFirestore.instance.collection('colaboradores').add({
        "nome": name,
        "email": email,
        "senha": password,
        "tipoUsuario": userType,
      });

      sucesso(context, 'Colaborador cadastrado com sucesso.');
    } else {
      erro(context, 'Preencha todos os campos');
    }
  }
}
