import 'package:app_teste_2/notificacao.dart';
import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';

class NotificacaoController {
  final String tableName = 'notificacoes';

  Future<List<Notificacao>> findAll() async {
    List<Notificacao> list = <Notificacao>[];

    DatabaseHelper databaseHelper = DatabaseHelper();
    Database db = await databaseHelper.db;

    String sql = 'SELECT * FROM $tableName';
    final result = await db.rawQuery(sql);

    for (var json in result) {
      Notificacao notificacao = Notificacao.fromJson(json);
      list.add(notificacao);
    }

    await Future.delayed(const Duration(seconds: 3));

    return list;
  }
}
