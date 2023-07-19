class Product {
  String name = '';
  double price = 0;

  Product(String name, double price) {
    this.name = name;
    this.price = price;
  }
  //Jeito otimizado
  //Product(this.name, this.price);
}

main() {
  var prod1 = new Product("Pencil", 4.59);
  print("The product ${prod1.name} has price ${prod1.price}");
}
