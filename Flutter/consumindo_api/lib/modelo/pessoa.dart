// To parse this JSON data, do
//
//     final pessoa = pessoaFromJson(jsonString);

import 'dart:convert';

Pessoa pessoaFromJson(String str) => Pessoa.fromJson(json.decode(str));

String pessoaToJson(Pessoa data) => json.encode(data.toJson());

class Pessoa {
  List<PessoaElement> pessoa;

  Pessoa({
    required this.pessoa,
  });

  factory Pessoa.fromJson(Map<String, dynamic> json) => Pessoa(
        pessoa: List<PessoaElement>.from(
            json["pessoa"].map((x) => PessoaElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pessoa": List<dynamic>.from(pessoa.map((x) => x.toJson())),
      };
}

class PessoaElement {
  String nome;
  List<Telefone> telefone;
  String email;
  String nascimento;

  PessoaElement({
    required this.nome,
    required this.telefone,
    required this.email,
    required this.nascimento,
  });

  factory PessoaElement.fromJson(Map<String, dynamic> json) => PessoaElement(
        nome: json["nome"],
        telefone: List<Telefone>.from(
            json["telefone"].map((x) => Telefone.fromJson(x))),
        email: json["email"],
        nascimento: json["nascimento"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "telefone": List<dynamic>.from(telefone.map((x) => x.toJson())),
        "email": email,
        "nascimento": nascimento,
      };
}

class Telefone {
  String residencial;
  String celular;

  Telefone({
    required this.residencial,
    required this.celular,
  });

  factory Telefone.fromJson(Map<String, dynamic> json) => Telefone(
        residencial: json["residencial"],
        celular: json["celular"],
      );

  Map<String, dynamic> toJson() => {
        "residencial": residencial,
        "celular": celular,
      };
}
