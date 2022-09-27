class Usuario {
  String? email;
  String? senha;
  String? nome;

  Usuario({this.email, this.senha, this.nome});

  Usuario.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    senha = json['senha'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['nome'] = this.nome;
    return data;
  }
}
