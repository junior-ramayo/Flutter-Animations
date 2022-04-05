import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/coffee-app/widgets/coffe_concept_home.dart';


 class HomeCoffee extends StatefulWidget {
   const HomeCoffee({Key? key}) : super(key: key);
 
   @override
   State<HomeCoffee> createState() => _HomeCoffeeState();
 }
 
 class _HomeCoffeeState extends State<HomeCoffee> {
  @override
  Widget build(BuildContext context) {
   return Theme(
    data: ThemeData.light(), 
    child: const CoffeeConceptHome()
   );
  }
 }