import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';
import 'usuario.dart';

class UsuarioController {
  final String tableName = 'usuario';

  Future<List<Usuario>> findAll() async {
    List<Usuario> list = <Usuario>[];

    DatabaseHelper databaseHelper = DatabaseHelper();
    Database db = await databaseHelper.db;

    String sql = 'SELECT * FROM $tableName';
    final result = await db.rawQuery(sql);

    for (var json in result) {
      Usuario usuario = Usuario.fromJson(json);
      list.add(usuario);
    }

    await Future.delayed(const Duration(seconds: 3));

    return list;
  }

  Future<bool> login(email, senha) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    Database db = await databaseHelper.db;
    String sql = 'SELECT email,senha FROM $tableName where email=? and senha=?';
    final result = await db.rawQuery(sql, [email, senha]);
    if (result.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<bool> cadastrarUsuario(Usuario usuario) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    Database db = await databaseHelper.db;
    String sql = "INSERT INTO usuario (nome, email, senha) VALUES (?, ?, ?);";
    final result = await db.rawInsert(sql, [
      usuario.nome,
      usuario.email,
      usuario.senha,
    ]);
    if (result > 0) {
      return true;
    }
    return false;
  }
}
