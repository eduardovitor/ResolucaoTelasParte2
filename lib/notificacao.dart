class Notificacao {
  String? texto;

  Notificacao({this.texto});

  Notificacao.fromJson(Map<String, dynamic> json) {
    texto = json['texto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['texto'] = this.texto;
    return data;
  }
}
