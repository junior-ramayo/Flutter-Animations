import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/animatedWidgets/home_animated.dart';
import 'package:retos_animaciones/animations/composition/home_composition.dart';
import 'package:retos_animaciones/animations/list-scroll-animation/scroll-animation.dart';
import 'package:retos_animaciones/home/home_page.dart';


 class RoutesApp {
  getRoutes(){
   return {
    'home_main': (BuildContext context) => const HomePage(),
    'home_composition': (BuildContext context) => HomeComposition(),
    'home_animated': (BuildContext context) => HomeAnimated(),
    'home_scroll': (BuildContext context) => ListScrollAnimation(),
   };
  }
 }

