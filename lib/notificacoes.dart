import 'package:app_teste_2/notificacao.dart';
import 'package:app_teste_2/notificacao_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Notificacoes extends StatefulWidget {
  const Notificacoes({Key? key}) : super(key: key);

  @override
  State<Notificacoes> createState() => _NotificacoesState();
}

class _NotificacoesState extends State<Notificacoes> {
  late Future<List<Notificacao>> notificacoes;
  @override
  void initState() {
    super.initState();
    notificacoes = NotificacaoController().findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildFutureBuild());
  }

  buildText(Notificacao notificacao) {
    return Text(notificacao.texto!);
  }

  buildListViewBuilder(List<Notificacao> notificacoes) {
    return ListView.builder(
      itemCount: notificacoes.length,
      itemBuilder: (BuildContext context, int index) {
        return buildText(notificacoes[index]);
      },
    );
  }

  buildFutureBuild() {
    return FutureBuilder<List<Notificacao>>(
        future: notificacoes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildListViewBuilder(snapshot.data!);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
