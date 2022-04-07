 

 class GroceryProduct {

  final double price;
  final String name;
  final String description;
  final String image;
  final String weight;

  GroceryProduct({
   required this.price, 
   required this.name, 
   required this.description, 
   required this.image, 
   required this.weight
  });

 }

  

 List<GroceryProduct> groceryProducts = [
  GroceryProduct(
   price: 25, 
   name: 'Bananas', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/banana.png', 
   weight: '500g'
  ),
  GroceryProduct(
   price: 45, 
   name: 'Blueberries', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/blueberries.png', 
   weight: '250g'
  ),
  GroceryProduct(
   price: 75, 
   name: 'Cerezas', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/cerezas.png', 
   weight: '120g'
  ),
  GroceryProduct(
   price: 85, 
   name: 'Cocos', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/cocos.png', 
   weight: '400g'
  ),
  GroceryProduct(
   price: 90, 
   name: 'Duraznos', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/durazno.png', 
   weight: '200g'
  ),
  GroceryProduct(
   price: 65, 
   name: 'Fresas', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.',
   image: 'assets/grocery/fresas.png', 
   weight: '400g'
  ),
  GroceryProduct(
   price: 150, 
   name: 'Granada', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/granada.png', 
   weight: '300g'
  ),
  GroceryProduct(
   price: 130, 
   name: 'Guanabana', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/guanabana.png', 
   weight: '800g'
  ),
  GroceryProduct(
   price: 100, 
   name: 'Kiwi', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/kiwi.png', 
   weight: '100g'
  ),
  GroceryProduct(
   price: 85, 
   name: 'Mandarina', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/mandarina.png', 
   weight: '200g'
  ),
  GroceryProduct(
   price: 120, 
   name: 'Mango', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/mango.png', 
   weight: '400g'
  ),
  GroceryProduct(
   price: 65, 
   name: 'Manzana', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/manzana.png', 
   weight: '180g'
  ),
  GroceryProduct(
   price: 250, 
   name: 'Naranja', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/naranja.png', 
   weight: '200g'
  ),
  GroceryProduct(
   price: 80, 
   name: 'Papaya', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/papaya.png', 
   weight: '600g'
  ),
  GroceryProduct(
   price: 97, 
   name: 'Pera', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/pera.png', 
   weight: '300g'
  ),
  GroceryProduct(
   price: 135, 
   name: 'Piña', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/piña.png', 
   weight: '400g'
  ),
  GroceryProduct(
   price: 35, 
   name: 'Pitahaya', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/pitahaya.png', 
   weight: '350g'
  ),
  GroceryProduct(
   price: 126, 
   name: 'Sandia', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/sandia.png', 
   weight: '900g'
  ),
  GroceryProduct(
   price: 78, 
   name: 'Uvas', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/uvas.png', 
   weight: '120g'
  ),
  GroceryProduct(
   price: 110, 
   name: 'Zarzamora', 
   description: 'Deserunt irure eiusmod voluptate cupidatat ex eu irure laboris adipisicing ullamco. Nulla qui consectetur ad excepteur tempor aliquip mollit eu fugiat ipsum occaecat. Adipisicing duis duis irure ea aliquip ullamco duis elit ad voluptate. Id esse ipsum nisi consequat mollit Lorem. Ea nulla enim esse nulla eu.', 
   image: 'assets/grocery/granada.png', 
   weight: '400g'
  ),
  
 ];