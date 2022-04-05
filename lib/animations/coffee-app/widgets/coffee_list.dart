import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/coffee-app/models/coffee.dart';
import 'package:retos_animaciones/animations/coffee-app/pages/details/coffee_details.dart';


const _initialPage = 7.0;

 class CoffeeConceptList extends StatefulWidget {
  
  const CoffeeConceptList({Key? key}) : super(key: key);

  @override
  State<CoffeeConceptList> createState() => _CoffeeConceptListState();
}

class _CoffeeConceptListState extends State<CoffeeConceptList> {


  final _coffeeController = PageController(
    viewportFraction: 0.35, //aqui le decimos que queremos ver 3 elementos
    initialPage: _initialPage.toInt()
  );
  final _textController = PageController(
    initialPage: _initialPage.toInt()
  );
  double _currentPage = _initialPage;
  double _textPage = _initialPage;

  void _coffeeScrollListener(){
   setState(() {
      _currentPage = _coffeeController.page!;
   });
  }

  void _textScrollListener(){
    setState(() {
      _textPage = _currentPage;
    });
  }

  @override
  void initState() {
    _coffeeController.addListener(_coffeeScrollListener);
    _textController.addListener(_textScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _coffeeController.removeListener(_coffeeScrollListener);
    _textController.removeListener(_textScrollListener);
    _coffeeController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
   return Scaffold(
    appBar: AppBar(
     elevation: 0,
     backgroundColor: Colors.transparent,
     leading: const BackButton(
      color: Colors.black,
     ),
    ),
    body: Stack(
     children: [
      Positioned(
       left: 20,
       right: 20,
       bottom: -size.height * 0.22,
       height: size.height * 0.3,
       child: const DecoratedBox(
        decoration: BoxDecoration(
         shape: BoxShape.circle,
         boxShadow: [
          BoxShadow(
           color: Colors.brown,
           blurRadius: 90,
           spreadRadius: 45
          )
         ]
        ),
       ),
      ),
        Transform.scale(
          scale: 1.6,
          alignment: Alignment.bottomCenter,
          child: PageView.builder(
           controller: _coffeeController,
           itemCount: Coffee.coffeeList.length + 1,
           scrollDirection: Axis.vertical,
           onPageChanged: (value){
             if(value < Coffee.coffeeList.length){
               _textController.animateToPage(
                value, 
                duration: const Duration(milliseconds: 500), 
                curve: Curves.easeOut
               );
             }
           },
           itemBuilder: (context, index){
            if(index == 0){
             return const SizedBox.shrink();
            }
            final coffee = Coffee.coffeeList[index - 1];
            final result = _currentPage - index + 1;
            final value = -0.4 * result + 1;
            final opacity = value.clamp(0.0, 1.0);
            return GestureDetector(
              onTap: (){
               if(result == 0){
                Navigator.of(context).push(
                 PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 650),
                  pageBuilder: (context, animation, _){
                   return FadeTransition(
                    opacity: animation,
                    child: CoffeeDetails(coffee: coffee),
                   );
                  }
                 )
                );
               }
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Transform(
                 alignment: Alignment.bottomCenter,
                 transform: Matrix4.identity()
                 ..setEntry(3, 2, 0.001)
                 ..translate(0.0, size.height / 2.6 * (1 - value).abs())
                 ..scale(value),
                 child: Opacity(
                  opacity: opacity,
                  child: Hero(
                    tag: coffee.name,
                    child: Image.asset(
                     coffee.pathImage,
                     fit: BoxFit.fitHeight,
                    ),
                  )
                 )
                ),
              ),
            );
           },
          ),
        ),
      Positioned(
       top: 0,
       left: 0,
       right: 0,
       height: 100,
       child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 1.0, end: 0.0), 
        duration: const Duration(milliseconds: 500), 
        builder: (context, value, child){
         return Transform.translate(
          offset: Offset(0.0, -100 * value),
          child: child
         );
        },
        child: Column(
         children: [
          Expanded(
           child: PageView.builder(
            itemCount: Coffee.coffeeList.length,
            controller: _textController,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
             final opacity = (1 - (index - _textPage).abs()).clamp(0.0, 1.0);
             return Opacity(
              opacity: opacity,
              child: Padding(
               padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
               child: Hero(
                tag: "text_${Coffee.coffeeList[index].name}",
                child: Material(
                 child: Text(
                  Coffee.coffeeList[index].name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                   fontSize: 25,
                   fontWeight: FontWeight.w700
                  ),
                 ),
                ),
               ),
              ),
             );
            },
           ),
          ),
          AnimatedSwitcher(
           duration: const Duration(milliseconds: 500),
           child: Text(
            'MXN ${Coffee.coffeeList[_currentPage.toInt()].price.toStringAsFixed(2)}',
            style: const TextStyle(
             fontSize: 30
            ),
            key: Key(Coffee.coffeeList[_currentPage.toInt()].name),
           ),
          ),
         ],
        ),
       )
      ),
     ],
    ),
   );
  }
}