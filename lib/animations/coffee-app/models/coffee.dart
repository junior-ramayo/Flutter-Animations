class Coffee {
  final String name;
  final String pathImage;
  final double price;

  const Coffee(this.name, this.pathImage, this.price);

  static const coffeeList = [
    Coffee('Vietnamese Style Iced Coffee', 'assets/coffee/9.png', 4.2),
    Coffee('Classic Irish Coffee', 'assets/coffee/11.png', 4.3),
    Coffee('Americano', 'assets/coffee/8.png', 3.3),
    Coffee('Caramel Macchiato', 'assets/coffee/1.png', 3.2),
    Coffee('Toffee Nut Iced Latte', 'assets/coffee/7.png', 4.0),
    Coffee('Caramelized Pecan Latte', 'assets/coffee/4.png', 3.5),
    Coffee('Toffee Nut Latte', 'assets/coffee/5.png', 3.9),
    Coffee('Iced Coffe Mocha', 'assets/coffee/3.png', 3.2),
    Coffee('Capuchino', 'assets/coffee/6.png', 3.1),
    Coffee('Caramel Cold Drink', 'assets/coffee/2.png', 3.2),
    Coffee('Black Tea Latte', 'assets/coffee/10.png', 4.3),
    Coffee('Toffee Nut Crunch Latte', 'assets/coffee/12.png', 3.7),
  ];
}