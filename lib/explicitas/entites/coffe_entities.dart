class CoffeeEntity {
  final String name;
  final String price;
  final String image;

  CoffeeEntity({
    required this.name,
    required this.price,
    required this.image,
  });
}

final coffeeList = [
  CoffeeEntity(
    name: "Caramel Macchiato",
    price: "43.54",
    image: 'assets/coffee/10.png',
  ),
  CoffeeEntity(
    name: "Espresso",
    price: "39.99",
    image: 'assets/coffee/2.png',
  ),
  CoffeeEntity(
    name: "Latte",
    price: "45.60",
    image: 'assets/coffee/3.png',
  ),
  CoffeeEntity(
    name: "Mocha",
    price: "47.25",
    image: 'assets/coffee/4.png',
  ),
  CoffeeEntity(
    name: "Cappuccino",
    price: "41.30",
    image: 'assets/coffee/5.png',
  ),
  CoffeeEntity(
    name: "Affogato",
    price: "52.10",
    image: 'assets/coffee/6.png',
  ),
  CoffeeEntity(
    name: "Americano",
    price: "37.45",
    image: 'assets/coffee/11.png',
  ),
  CoffeeEntity(
    name: "Irish Coffee",
    price: "55.75",
    image: 'assets/coffee/8.png',
  ),
  CoffeeEntity(
    name: "Macchiato",
    price: "42.80",
    image: 'assets/coffee/1.png',
  ),
  CoffeeEntity(
    name: "Ristretto",
    price: "38.20",
    image: 'assets/coffee/9.png',
  ),
  CoffeeEntity(
    name: "Vienna Coffee",
    price: "49.90",
    image: 'assets/coffee/7.png',
  ),
];
