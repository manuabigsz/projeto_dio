class TarefaModelSQLite {
  int _id = 0;
  String _descricao = '';
  bool _concluido = false;

  TarefaModelSQLite(this._id, this._descricao, bool bool);

  int get id => _id;

  String get descricao => _descricao;

  set descricao(String descricao) {
    _descricao = descricao;
  }

  bool get concluido => _concluido;

  set concluido(bool concluido) {
    _concluido = concluido;
  }

  set id(int id) {
    _id = id;
  }
}
