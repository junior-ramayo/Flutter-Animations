import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/travel-app/models/travel.dart';
import 'package:retos_animaciones/animations/travel-app/pages/details/details.dart';
import 'package:retos_animaciones/animations/travel-app/pages/home/widgets/place_card.dart';
import 'package:retos_animaciones/animations/travel-app/pages/home/widgets/travel_navigation_bar.dart';


 class TravelHome extends StatefulWidget {
   TravelHome({Key? key}) : super(key: key);
 
   @override
   State<TravelHome> createState() => _TravelHomeState();
 }
 
 class _TravelHomeState extends State<TravelHome> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Feed', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.search, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.star, color: Colors.black),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: TravelPlace.places.length,
        itemExtent: 350,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, kToolbarHeight + 20),
        itemBuilder: (context, index) {
          final place = TravelPlace.places[index];
          return Hero(
            tag: place.id,
            child: Material(
              child: PlaceCard(
                place: place,
                onPressed: () async {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, animation, __) => FadeTransition(
                        opacity: animation,
                        child: PlaceDetailScreen(
                          place: place,
                          screenHeight: MediaQuery.of(context).size.height,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.location_on),
      ),
      bottomNavigationBar: TravelNavigationBar(
        onTap: (index) {},
        items: [
          TravelNavigationBarItem(
            icon: CupertinoIcons.chat_bubble,
            selectedIcon: CupertinoIcons.chat_bubble_fill,
          ),
          TravelNavigationBarItem(
            icon: CupertinoIcons.square_split_2x2,
            selectedIcon: CupertinoIcons.square_split_2x2_fill,
          ),
        ],
        currentIndex: 1,
      ),
    );
  }
 }