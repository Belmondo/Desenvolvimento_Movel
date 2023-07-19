main() {
  //primeira criação de variaveis
  int variavelInteira = 2;
  double variavelPontoFlutuante = 5.3;
  num valorNumericoQualquer = 13.7;

  //var não é um valor genérico, mas sim um valor o qual o compilador vai inferir
  var numeroInferente = 10;
  var textoInferente = "texto";
  //a linha abaixo resultará em erros
  //numeroInferente = "testandoMudança";

  bool estaChovendo = true;

  // é um tipo sem valor predefinido, e que pode ser alterado em tempo de execução
  dynamic x = "ABC";
  x = 123;
  x = 5.9;

  //listas
  var names = ["Ana", "Carlos", "George"];
  names.add("Marcus");
  print(names.length);
  print(names.elementAt(3));
  print(names[3]);
}
