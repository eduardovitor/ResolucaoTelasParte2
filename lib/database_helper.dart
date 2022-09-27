import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late Database _db;

  Future<Database> get db async {
    _db = await _initDB();
    return _db;
  }

  _initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'teste.db');
    //  print('> Path database: $path');

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );

    return database;
  }

  onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE usuario(id int auto_increment primary key, nome varchar(50) NOT NULL, email varchar(30) NOT NULL, senha VARCHAR(16) NOT NULL);';
    await db.execute(sql);

    //Inserções
    sql =
        "INSERT INTO usuario (nome, email, senha) VALUES ('admin','admin@gmail.com','123');";
    await db.execute(sql);
  }
}
