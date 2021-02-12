class Saude{
  int id;
  String titulo;
  String data_hora;
  String tipo;
  String descricao;

  Saude.fromMap(Map<String, dynamic> json) {
    id = json['_id'];
    titulo = json['titulo'];
    tipo = json['tipo'];
    data_hora = json['data_hora'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'data_hora': data_hora,
      'tipo':tipo,
      'descricao':descricao
    };
  }
}