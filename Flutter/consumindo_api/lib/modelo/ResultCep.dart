import 'dart:convert';

ResultCep resultCepFromJson(String str) => ResultCep.fromJson(json.decode(str));

String resultCepToJson(ResultCep data) => json.encode(data.toJson());

class ResultCep {
  String logradouro;
  String complemento;
  String bairro;
  String localidade;

  ResultCep({
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
  });

  factory ResultCep.fromJson(Map<String, dynamic> json) => ResultCep(
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        localidade: json["localidade"],
      );

  Map<String, dynamic> toJson() => {
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "localidade": localidade,
      };

  String toString() {
    return "Logradouro: $logradouro  Complemento: $complemento Bairro: $bairro";
  }
}
