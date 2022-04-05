import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/NavBar-Expanded/navbar.dart';
import 'package:retos_animaciones/animations/coffee-app/pages/home/home_coffee.dart';
import 'package:retos_animaciones/animations/tabs-synchronization/pages/home_synchronization.dart';
import 'package:retos_animaciones/animations/template-gallery/list-page.dart';
import 'package:retos_animaciones/animations/travel-app/pages/home/home_travel.dart';
import 'package:retos_animaciones/home/home_page.dart';


 class RoutesApp {
  getRoutes(){
   return {
    'home_main': (BuildContext context) => const HomePage(),
    'home_navbar': (BuildContext context) => const NavBarExpanded(),
    'home_listPage': (BuildContext context) => const ContactListPage(),
    'home_tabs': (BuildContext context) => const TabsSynchronization(),
    'home_travel': (BuildContext context) => TravelHome(),
    'home_coffee': (BuildContext context) => HomeCoffee(),
   };
  }
 }

