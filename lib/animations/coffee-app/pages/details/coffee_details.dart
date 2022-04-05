import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/coffee-app/models/coffee.dart';
import 'package:retos_animaciones/animations/coffee-app/pages/details/widgets/coffee_sizes.dart';
import 'package:retos_animaciones/animations/coffee-app/pages/details/widgets/coffee_temparatures.dart';

enum CoffeeSize { s, m, b }

 class CoffeeDetails extends StatefulWidget {

  final Coffee coffee;

  const CoffeeDetails({
   Key? key, 
   required this.coffee
  }) : super(key: key);

  @override
  State<CoffeeDetails> createState() => _CoffeeDetailsState();
}

class _CoffeeDetailsState extends State<CoffeeDetails> {

  late CoffeeSize _selectedCoffeeSize;
  final _pageController = PageController(initialPage: 1);

  @override
  void initState() {
    _selectedCoffeeSize = CoffeeSize.m;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
   return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
     backgroundColor: Colors.transparent,
     elevation: 0,
     leading: const BackButton(
      color: Colors.black,
     ),
    ),
    body: Column(
     crossAxisAlignment: CrossAxisAlignment.stretch,
     children: [
       Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
        child: Hero(
          tag: "text_${widget.coffee.name}",
          child: Material(
            child: Text(
             widget.coffee.name,
             maxLines: 2,
             textAlign: TextAlign.center,
             style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700
             ),
            ),
          ),
        ),
       ),
       const SizedBox(height: 30),
       SizedBox(
        height: size.height * 0.4,
        child: Stack(
         children: [
          Positioned.fill(
           child: Hero(
            tag: widget.coffee.name,
            child: Image.asset(
             widget.coffee.pathImage,
             fit: BoxFit.fitHeight,
            ),
           ),
          ),
          Positioned(
           left: size.width * 0.05,
           bottom: 0,
           child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 1.0, end: 0.0), 
            duration: const Duration(milliseconds: 500), 
            builder: (context, value, child){
              return Transform.translate(
               offset: Offset(-100 * value, 150 * value),
               child: child
              );
            },
            child: Text(
              '\$ ${widget.coffee.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                shadows: [
                 BoxShadow(
                  color: Colors.black45,
                  blurRadius: 10,
                  spreadRadius: 20
                 )
                ]
              ),
            ),
           ),
          ),
         ],
        ),
       ),

      Expanded(
       child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 600),
        tween: Tween(begin: 1.0, end: 0.0),
        curve: Curves.fastOutSlowIn,
        builder: (context, value, child) {
         return Transform.translate(
          offset: Offset(0, (size.height * .2) * value),
          child: child,
         );
        },
        child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: List.generate(
          CoffeeSize.values.length, 
          (index) {
           final coffeeSize = CoffeeSize.values[index];
           return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: CoffeeSizeOption(
             isSelected: (coffeeSize == _selectedCoffeeSize),
             coffeeSize: coffeeSize,
             onTap: () => _changeCoffeeSize(coffeeSize)
            ),
           );
          }
         ),
        ),
       ),
      ),

      Expanded(
       child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 600),
        tween: Tween(begin: 1.0, end: 0.0),
        curve: Curves.fastOutSlowIn,
        builder: (context, value, child) {
         return Transform.translate(
          offset: Offset(0, (size.height * .2) * value),
          child: child,
         );
        },
        child: const CoffeeTemperatures(),
       ),
      ),
     ],
    ),
   );
  }

  
  void _changeCoffeeSize(CoffeeSize coffeeSize) {
    _pageController.animateToPage(
      coffeeSize.index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
    setState(() {
      _selectedCoffeeSize = coffeeSize;
    });
  }

}

 

