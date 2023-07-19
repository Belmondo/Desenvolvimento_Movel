import 'dart:math';

main() {
  var nota = Random().nextInt(11);
  print("Nota sorteada foi $nota.");

  if (nota >= 6) {
    print("Aprovadaço");
  } else {
    print("Reprovado");
  }
}
