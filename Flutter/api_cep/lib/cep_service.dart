import 'package:http/http.dart' as http;
import 'package:projeto_api/result_cep.dart';

class CepService {
  static Future<ResultCep> fetchCep({Uri? cep}) async {
    final response = await http.get('https://viacep.com.br/ws/$cep/json/');
    if (response.statusCode == 200) {
      return ResultCep.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
