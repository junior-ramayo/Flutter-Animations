import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/NavBar-Expanded/navbar.dart';
import 'package:retos_animaciones/animations/animatedWidgets/home_animated.dart';
import 'package:retos_animaciones/animations/composition/home_composition.dart';
import 'package:retos_animaciones/animations/list-scroll-animation/scroll-animation.dart';
import 'package:retos_animaciones/animations/splash-screen/pages/home.dart';
import 'package:retos_animaciones/animations/tabs-synchronization/pages/home_synchronization.dart';
import 'package:retos_animaciones/animations/template-gallery/list-page.dart';
import 'package:retos_animaciones/home/home_page.dart';


 class RoutesApp {
  getRoutes(){
   return {
    'home_main': (BuildContext context) => const HomePage(),
    'home_composition': (BuildContext context) => const HomeComposition(),
    'home_animated': (BuildContext context) => const HomeAnimated(),
    'home_scroll': (BuildContext context) => const ListScrollAnimation(),
    'home_navbar': (BuildContext context) => const NavBarExpanded(),
    'home_listPage': (BuildContext context) => const ContactListPage(),
    'home_tabs': (BuildContext context) => TabsSynchronization(),
    'home_splash': (BuildContext context) => SplashPage()
   };
  }
 }

