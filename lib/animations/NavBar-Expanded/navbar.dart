import 'dart:ui';

import 'package:flutter/material.dart';


 class NavBarExpanded extends StatefulWidget {
   NavBarExpanded({Key? key}) : super(key: key);
 
   @override
   State<NavBarExpanded> createState() => _NavBarExpandedState();
 }
 
 class _NavBarExpandedState extends State<NavBarExpanded> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  final double _maxHeight = 350.0;
  final double _minHeight = 70.0;
  double _currentHeight = 70.0;
  bool _expanded = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
   final menuWidth = size.width * 0.5;
   return Scaffold(
    body: Stack(
      children: [
        ListView.builder(
         padding: EdgeInsets.only(bottom: _minHeight),
         itemCount: 5,
         itemBuilder: (context, index){
          return Padding(
           padding: const EdgeInsets.all(20.0),
           child: Container(
            height: 300,
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(20.0),
             color: Colors.red
            ),
           ),
          );
         }
        ),
        _menu(menuWidth, size),
      ],
    ),
   );
  }

  Widget _menu(menuWidth, size){
   return GestureDetector(
    onVerticalDragUpdate: _expanded ? (details){
     setState(() {
      final newHeight = _currentHeight - details.delta.dy;
      _controller.value = _currentHeight / _maxHeight;
      _currentHeight = newHeight.clamp(_minHeight, _maxHeight);
     });
    } : null,
    onVerticalDragEnd: _expanded ? (details){
     if(_currentHeight < _maxHeight / 1.5){
      _controller.reverse();
      _expanded = false;
     } else {
      _expanded = true;
      _controller.forward(from: _currentHeight / _maxHeight);
      _currentHeight = _maxHeight;
     }
    } : null,
    child: AnimatedBuilder(
     animation: _controller,
     builder: (context, snapshot) {
      final value = const ElasticInOutCurve(0.7).transform(_controller.value);
      return Stack(
       children: [
        Positioned(
         height: lerpDouble(_minHeight, _currentHeight, value),
         left: lerpDouble(size.width / 2 - menuWidth / 2, 0, value),
         width: lerpDouble(menuWidth, size.width, value),
         bottom: lerpDouble(40, 0, value),
         child: Container(
          decoration: BoxDecoration(
           color: const Color(0XFF5F40FB),
           borderRadius: BorderRadius.vertical(
            top: const Radius.circular(20.0),
            bottom: Radius.circular(
             lerpDouble(20.0, 0.0, value)!
            )
           )
          ),
          child: _expanded ? Opacity(
           opacity: _controller.value,
           child: _buildExpandedContent()
          ) : _buildMenuContent(),
         ),
        ),   
       ]
      );
     }
    ),
   );
  }

  Widget _buildExpandedContent(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: 80,
              width: 80,
            ),
            const SizedBox(height: 15),
            const Text(
              'Last Century',
              style: TextStyle(
                fontSize: 12
              ),
            ),
            const SizedBox(height: 15),
            const Text('Bloody Tear', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.shuffle),
                Icon(Icons.pause),
                Icon(Icons.playlist_add),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuContent(){
   return GestureDetector(
    onTap: (){
     setState(() {
      _expanded = true;
      _currentHeight = _maxHeight;
      _controller.forward(from: 0.0);
     });
    },
    child: Row(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children: const [
      Icon(Icons.calendar_today_sharp),
      Icon(Icons.calendar_today),
      Icon(Icons.calendar_today_sharp),
     ],
    ),
    );
  }

 }