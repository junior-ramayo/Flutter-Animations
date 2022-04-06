
 class Category {
   final String name;
   final List<Product> products;

  Category({required this.name, required this.products});
 }

 class Product {
   final String name;
   final String description;
   final double price;
   final String image;

  Product({required this.name, required this.description, required this.price, required this.image});
 
 }

 final categories = [
  Category(
    name: 'Pizzas', 
    products: [
     Product(
      name: 'Hawaina', 
      description: 'pizza hawaiana para toda la familia con trozos de piña y pepperoni, tamaño grande para 5 personas', 
      price: 390.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Italiana', 
      description: 'pizza Italiana para toda la familia con trozos de pimientos y pepperoni, tamaño grande para 5 personas', 
      price: 350.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Hawaina', 
      description: 'pizza hawaiana para toda la familia con trozos de piña y pepperoni, tamaño grande para 5 personas', 
      price: 390.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Italiana', 
      description: 'pizza Italiana para toda la familia con trozos de pimientos y pepperoni, tamaño grande para 5 personas', 
      price: 350.0, 
      image: 'assets/img.jpg'
     ),
    ]
  ),
  Category(
    name: 'Tacos', 
    products: [
     Product(
      name: 'Pastor', 
      description: 'Taco de pastor con cebolla y un trozo de piña', 
      price: 87.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Arrachera', 
      description: 'Taco de arrachera, con la carne mas selecta del mercado', 
      price: 120.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Pastor', 
      description: 'Taco de pastor con cebolla y un trozo de piña', 
      price: 87.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Arrachera', 
      description: 'Taco de arrachera, con la carne mas selecta del mercado', 
      price: 120.0, 
      image: 'assets/img.jpg'
     ),
    ]
  ),
  Category(
    name: 'Tortas', 
    products: [
     Product(
      name: 'Bistec', 
      description: 'Torta de bistec con la carne mejor conservada del mercado', 
      price: 200.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Chistorra', 
      description: 'Torta de chistorra con salchicha argentina y acompañada de nuestro delicioso deep', 
      price: 230.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Bistec', 
      description: 'Torta de bistec con la carne mejor conservada del mercado', 
      price: 200.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Chistorra', 
      description: 'Torta de chistorra con salchicha argentina y acompañada de nuestro delicioso deep', 
      price: 230.0, 
      image: 'assets/img.jpg'
     ),
    ]
  ),
  Category(
    name: 'Alitas', 
    products: [
     Product(
      name: 'BBQ', 
      description: 'Nuestra deliciosa orden de alitas con salsa BBQ acompañada de un refresco', 
      price: 150.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Mango Habanero', 
      description: 'Orden de 6 alitas con nuestra famosa salsa mango habanero, acompañada de nuestra salsa Cheddar', 
      price: 130.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'BBQ', 
      description: 'Nuestra deliciosa orden de alitas con salsa BBQ acompañada de un refresco', 
      price: 150.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Mango Habanero', 
      description: 'Orden de 6 alitas con nuestra famosa salsa mango habanero, acompañada de nuestra salsa Cheddar', 
      price: 130.0, 
      image: 'assets/img.jpg'
     ),
    ]
  ),
  Category(
    name: 'Boneless', 
    products: [
     Product(
      name: 'Cheddar', 
      description: 'Orden de 6 boneless con nuestra rica salsa de chedda para chuparse los dedos', 
      price: 150.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'BBQ Chipotle', 
      description: 'Orden de 6 boneless con salsa BBQ Chipotle acompañada de pepino y zanahoria', 
      price: 130.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Cheddar', 
      description: 'Orden de 6 boneless con nuestra rica salsa de chedda para chuparse los dedos', 
      price: 150.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'BBQ Chipotle', 
      description: 'Orden de 6 boneless con salsa BBQ Chipotle acompañada de pepino y zanahoria', 
      price: 130.0, 
      image: 'assets/img.jpg'
     ),
    ]
  ),
  Category(
    name: 'Sushi', 
    products: [
     Product(
      name: 'California', 
      description: 'Sushi california empanizado con 12 rollos y con pollo y queso philadelphia', 
      price: 160.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Doritos', 
      description: 'Sushi con empanizado con doritos y con pollo y aguacate', 
      price: 189.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'California', 
      description: 'Sushi california empanizado con 12 rollos y con pollo y queso philadelphia', 
      price: 160.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Doritos', 
      description: 'Sushi con empanizado con doritos y con pollo y aguacate', 
      price: 189.0, 
      image: 'assets/img.jpg'
     ),
    ]
  ),
  Category(
    name: 'Refrescos', 
    products: [
     Product(
      name: 'Coca-cola', 
      description: 'lata de refresco coca-cola de 600 ml', 
      price: 40.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Sprite', 
      description: 'lata de refresco sprite de 600 ml', 
      price: 40.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Coca-cola', 
      description: 'lata de refresco coca-cola de 600 ml', 
      price: 40.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Sprite', 
      description: 'lata de refresco sprite de 600 ml', 
      price: 40.0, 
      image: 'assets/img.jpg'
     ),
    ]
  ),
  Category(
    name: 'Postres', 
    products: [
     Product(
      name: 'Helado de coco', 
      description: 'Dos bolas de helado de coco natural', 
      price: 90.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Pastel de chocolate', 
      description: 'Rebanada de pastel de chocolate', 
      price: 110.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Helado de coco', 
      description: 'Dos bolas de helado de coco natural', 
      price: 90.0, 
      image: 'assets/img.jpg'
     ),
     Product(
      name: 'Pastel de chocolate', 
      description: 'Rebanada de pastel de chocolate', 
      price: 110.0, 
      image: 'assets/img.jpg'
     ),
    ]
  ),
 ];