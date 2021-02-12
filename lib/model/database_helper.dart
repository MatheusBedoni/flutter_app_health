import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
class DatabaseHelper {
  static final _databaseName = "epHealth.db";
  static final _databaseVersion = 1;
  static final table = 'user';
  static final columnId = '_id';
  static final columnNome = 'nome';
  static final columnCpf = 'cpf';
  static final columnEmail = 'email';
  static final columnDataNacimento = 'data_nasc';
  static final columnTelefone = 'telefone';
  static final columnAltura = 'altura';
  static final columnPeso = 'peso';

  //eventos de saúde
  static final tableSaude = 'saude';
  static final columnIdSaude = '_id';
  static final columnTitulo = 'titulo';
  static final columnTipo = 'tipo';
  static final columnData_hora = 'data_hora';
  static final columnDescricao = 'descricao';

  // torna esta classe singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  // tem somente uma referência ao banco de dados
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // instancia o db na primeira vez que for acessado
    _database = await _initDatabase();
    return _database;
  }
  // abre o banco de dados e o cria se ele não existir
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }
  // Código SQL para criar o banco de dados e a tabela
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnNome TEXT NOT NULL,
            $columnCpf TEXT NOT NULL,
            $columnEmail TEXT NOT NULL,
            $columnTelefone TEXT NOT NULL,
            $columnAltura TEXT NOT NULL,
            $columnDataNacimento TEXT NOT NULL,
            $columnPeso TEXT NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $tableSaude (
            $columnIdSaude INTEGER PRIMARY KEY,
            $columnTitulo TEXT NOT NULL,
            $columnTipo TEXT NOT NULL,
            $columnData_hora TEXT NOT NULL,
            $columnDescricao TEXT NOT NULL
          )
          ''');
  }
  // métodos Helper
  //----------------------------------------------------
  // Insere uma linha no banco de dados onde cada chave
  // no Map é um nome de coluna e o valor é o valor da coluna.
  // O valor de retorno é o id da linha inserida.
  Future<int> insert(Map<String, dynamic> row, String table) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // Assumimos aqui que a coluna id no mapa está definida. Os outros
  // valores das colunas serão usados para atualizar a linha.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Todas as linhas são retornadas como uma lista de mapas, onde cada mapa é
  // uma lista de valores-chave de colunas.
  Future<List<Map<String, dynamic>>> query() async {
    Database db = await instance.database;
    return await db.rawQuery('SELECT * FROM $tableSaude ');
  }
  Future<List<Map<String, dynamic>>> getUser() async {
    Database db = await instance.database;
    return await db.rawQuery('SELECT * FROM $table '
        'WHERE _id=?', [1]);
  }
  // Todos os métodos : inserir, consultar, atualizar e excluir,
  // também podem ser feitos usando  comandos SQL brutos.
  // Esse método usa uma consulta bruta para fornecer a contagem de linhas.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // Exclui a linha especificada pelo id. O número de linhas afetadas é
  // retornada. Isso deve ser igual a 1, contanto que a linha exista.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}