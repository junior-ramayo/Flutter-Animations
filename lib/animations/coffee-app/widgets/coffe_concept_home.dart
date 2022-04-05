import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/coffee-app/models/coffee.dart';
import 'package:retos_animaciones/animations/coffee-app/widgets/coffee_list.dart';

class CoffeeConceptHome extends StatelessWidget {
  
  const CoffeeConceptHome({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
   return Scaffold(
    body: GestureDetector(
      onVerticalDragUpdate: (details){
        if(details.primaryDelta! < -20){
          Navigator.of(context).push(
           PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 650),
            pageBuilder: (context, animation, _){
             return FadeTransition(
              opacity: animation,
              child: const CoffeeConceptList(),
             );
            }
           )
          );
        }
      },
      child: Stack(
       children: [
        const SizedBox.expand(
         child: DecoratedBox(
          decoration: BoxDecoration(
           gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
             Color(0xFFA89276),
             Colors.white
            ]
           )
          ),
         ),
        ),
        Positioned(
          height: size.height * 0.4,
          left: 0.0,
          right: 0.0,
          top: size.height * 0.15,
          child: Hero(
            tag: Coffee.coffeeList[6].name,
            child: Image.asset(Coffee.coffeeList[6].pathImage)
          ),
        ),
        Positioned(
          height: size.height * 0.7,
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Hero(
            tag: Coffee.coffeeList[7].name,
            child: Image.asset(
             Coffee.coffeeList[7].pathImage,
             fit: BoxFit.cover,
            )
          ),
        ),
        Positioned(
          height: size.height,
          left: 0.0,
          right: 0.0,
          bottom: -size.height * 0.8,
          child: Hero(
            tag: Coffee.coffeeList[8].name,
            child: Image.asset(
             Coffee.coffeeList[8].pathImage,
             fit: BoxFit.cover,
            )
          ),
        ),
        Positioned(
          height: 140,
          left: size.width / 2.5,
          // right: size.width * 0.20,
          bottom: size.height * 0.20,
          child: const Text(
            'Coffee',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w800
            ),
          ),
        ),
       ],
      ),
    ),
   );
  }

  
 }