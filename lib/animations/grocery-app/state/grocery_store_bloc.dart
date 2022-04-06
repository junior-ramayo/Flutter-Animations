import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/grocery-app/models/product/product.dart';

 enum GroceryState {normal, details, cart}

 class GroceryStoreBloc with ChangeNotifier {


  GroceryState groceryState = GroceryState.normal;
  List<GroceryProduct> catalog = List.unmodifiable(groceryProducts);
  List<GroceryProductItem> cart = [];

  void changeToNormal(){
    groceryState = GroceryState.normal;
    notifyListeners();
  }

  void changeToCart(){
    groceryState = GroceryState.cart;
    notifyListeners();
  }

  void addProduct(GroceryProduct product){
   for(GroceryProductItem i in cart){
    if(i.product.name == product.name){
     i.increment();
     notifyListeners();
     return;
    }
   }
   cart.add(GroceryProductItem(product: product) );
   notifyListeners();
  }

  int totalCartElement() => cart.fold<int>(0, (previousValue, element) => previousValue + element.quantity);


 }


 class GroceryProductItem {

  int quantity;
  final GroceryProduct product;

  GroceryProductItem({this.quantity = 1, required this.product});

   void increment(){
    quantity++;
   }

   void decrement(){}
 }