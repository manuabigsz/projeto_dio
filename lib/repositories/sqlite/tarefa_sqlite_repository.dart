import 'package:trilhaapp/model/tarefa_sqlite_model.dart';

import 'database.dart';

class TarefaSQLiteRepository {
  Future<List<TarefaModelSQLite>> obterDados(bool apenasNaoConcluidos) async {
    List<TarefaModelSQLite> tarefas = [];
    var db = await SQLiteDataBase().obterDataBase();
    var result = await db.rawQuery(apenasNaoConcluidos
        ? "SELECT id, descricao, concluido FROM tarefas WHERE concluido = 0"
        : 'SELECT id, descricao, concluido FROM tarefas');
    for (var element in result) {
      tarefas.add(TarefaModelSQLite(
          int.parse(element["id"].toString()) as int,
          element["descricao"].toString() as String,
          element["concluido"] == 1));
    }
    return tarefas;
  }

  Future<void> salvar(TarefaModelSQLite TarefaModelSQLite) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert('INSERT INTO tarefas (descricao, concluido) values(?,?)',
        [TarefaModelSQLite.descricao, TarefaModelSQLite.concluido]);
  }

  Future<void> atualizar(TarefaModelSQLite TarefaModelSQLite) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert(
        'UPDATE tarefas SET descricao = ?, concluido = ? WHERE id = ?', [
      TarefaModelSQLite.descricao,
      TarefaModelSQLite.concluido ? 1 : 0,
      TarefaModelSQLite.id
    ]);
  }

  Future<void> remover(int id) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert('DELETE FROM tarefas WHERE id = ?', [id]);
  }
}
