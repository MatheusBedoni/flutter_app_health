class User{
  int id;
  String nome;
  String cpf;
  String email;
  String data_nasc;
  String telefone;
  String altura;
  String peso;

  User.fromMap(Map<String, dynamic> json) {
    id = json['_id'];
    nome = json['nome'];
    cpf = json['cpf'];
    email = json['email'];
    data_nasc = json['data_nasc'];
    telefone = json['telefone'];
    altura = json['altura'];
    peso = json['peso'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'email':email,
      'data_nasc':data_nasc,
      'telefone':telefone,
      'altura':altura,
      'peso':peso
    };
  }
}