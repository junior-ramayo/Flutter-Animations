import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/animatedWidgets/widgets/column-widget.dart';


 class HomeAnimated extends StatefulWidget {
  
  const HomeAnimated({Key? key}) : super(key: key);
 
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
        margin: const EdgeInsets.only(top: 50, left: 15, bottom: 15),
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
    
       ColumnWidget(
        animationController: animationController
       )
    
      ],
     ),
    ),
   );
  }
 }


