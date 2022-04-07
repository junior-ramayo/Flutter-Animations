import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/grocery-app/state/grocery_store_bloc.dart';


 class GroceryProvider extends InheritedWidget {

  final GroceryStoreBloc bloc;
  final Widget child;

  const GroceryProvider({Key? key, required this.bloc, required this.child}) : super(key: key, child: child);

  static GroceryProvider? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<GroceryProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
   
 }