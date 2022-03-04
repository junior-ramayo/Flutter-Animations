import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


 class HomeAnimated extends StatefulWidget {
  
  HomeAnimated({Key? key}) : super(key: key);
 
  @override
  State<HomeAnimated> createState() => _HomeAnimatedState();
 }
 
 class _HomeAnimatedState extends State<HomeAnimated> with SingleTickerProviderStateMixin{

  late final AnimationController animationController;

  @override
  void initState() {
   animationController = AnimationController(
     vsync: this,
     duration: const Duration(seconds: 2),
   );
   animationController.forward(from: 0.0);
   super.initState();
  }

  @override
  void dispose() {
   animationController.dispose();
   super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: SingleChildScrollView(
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
    
       Container(
        margin: const EdgeInsets.only(top: 35),
        child: _columnWidget(
         animationController: animationController
        )
       )
    
      ],
     ),
    ),
   );
  }
 }


class _columnWidget extends AnimatedWidget {

  const _columnWidget({
    Key? key,
    required Animation<double> animationController,
  }) : super(key: key, listenable: animationController);


  @override
  Widget build(BuildContext context) {
   final animatedValue = listenable as Animation<double>;
   return Transform.translate(
    offset: Offset((1 - animatedValue.value) * 450, 0.0),
    child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [

       Container(
         margin: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
         child: const Text(
          'Contacts',
          style: TextStyle(
            fontSize: 47,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 1.5
          ),
         ),
       ),
    
      _card('assets/avatar-1.png', 'Junior', 'Developer', '116', [Colors.orange, Colors.pinkAccent]),
      _card('assets/avatar-2.jpg', 'Domenica', 'Designer', '7', [Colors.green,Colors.blue[300]!]),
      _card('assets/avatar-2.jpg', 'Vanessa', 'nutritionist', '13', [Colors.purple[100]!, Colors.pinkAccent]),
      _card('assets/avatar-1.png', 'Antonio', 'counter', '25', [Colors.red[300]!, Colors.amberAccent[700]!]),
      _card('assets/avatar-1.png', 'Antonio', 'counter', '25', [Colors.red[300]!, Colors.amberAccent[700]!]),
     
     ],
    ),
   );
  }

 Widget _card(String pathImage, String name, String title, String followers, List<Color> colors){
  return Container(
   margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
   padding: const EdgeInsets.only(top: 20),
   decoration: BoxDecoration(
    gradient: LinearGradient(
	   colors: colors,
	   begin: FractionalOffset.centerLeft,
	   end: FractionalOffset.centerRight,
	  ),
    borderRadius: BorderRadius.circular(20)
   ),
   child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
         shape: BoxShape.circle,
         image: DecorationImage(
          image: AssetImage(pathImage),
          fit: BoxFit.cover
         )
        ),
      ),

      Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        Text(
         name,
         style: const TextStyle(
          color: Colors.white,
          fontSize: 19,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2
         )
        ),
        Text(
         'Title: $title',
         style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          letterSpacing: 1.2
         )
        ),
        
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 15),
          child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
            itemNumbers('3323', 'Popularity'),
            itemNumbers('4736', 'Likes'),
            itemNumbers('136', 'Followed')
           ]
          ),
        ),
       ],
      ),

      Column(
       children:  [
         const Text(
           'OOO',
           style: TextStyle(
             color: Colors.white,
             fontSize: 12,
             fontWeight: FontWeight.bold,
             letterSpacing: 1.2
           )
         ),
         const SizedBox(height: 15),
         Column(
           children:  [
            Text(
              followers,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Ranking',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                letterSpacing: 1.0
              ),
            ),
           ],
         ),

       ]
      ),

    ],
   ),  
  );
 }

 Widget itemNumbers(String numPopularity, String text){
   return Container(
     margin: const EdgeInsets.only(right: 7),
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Text(
        numPopularity,
        style: const TextStyle(
         color: Colors.white,
         fontSize: 13,
         fontWeight: FontWeight.bold
        )
       ),
       Text(
        text,
        style: const TextStyle(
         color: Colors.white,
         fontSize: 12,
         fontWeight: FontWeight.bold,
         letterSpacing: 1.0
        ),
       )
      ]
     ),
   );
 }

}