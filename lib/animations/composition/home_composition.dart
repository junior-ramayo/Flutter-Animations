import 'package:flutter/material.dart';

 class HomeComposition extends StatefulWidget {
   HomeComposition({Key? key}) : super(key: key);
 
   @override
   State<HomeComposition> createState() => _HomeCompositionState();
 }
 
 class _HomeCompositionState extends State<HomeComposition> {
   
   int currentStep = 0;
   int maxStep = 10;
   double get percent => currentStep / maxStep;
   
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
       child: Padding(
         padding: const EdgeInsets.all(15),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children:  [
            
            Text('${(percent) * 100} %'),
             
            Padding(
              padding: const EdgeInsets.all(15),
              child: _LineAnimated(percent: percent),
            ),

           ],
         ),
       ),
      ),
      floatingActionButton: Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         FloatingActionButton(
          heroTag: 'btn1',
          onPressed: (){
            setState(() {
              if(currentStep < maxStep){
                currentStep += 1;
              }
            });
          },
          child: const Icon(Icons.add)
         ),
         FloatingActionButton(
          heroTag: 'btn2',
          onPressed: (){
            setState(() {
              if(currentStep > 0){
                currentStep -= 1;
              }
            });
          },
          child: const Icon(Icons.remove)
         )
       ],
      ),
     );
   }
 }

 class _LineAnimated extends StatelessWidget {

   final double percent;
   
   const _LineAnimated({
    Key? key, 
    required this.percent
   }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
    return LayoutBuilder(
     builder: (context, constraints){
      print(constraints.maxWidth); //meda el ancho de la pantalla del dispositivo.
      return Container(
       height: 10,
       alignment: Alignment.centerLeft,
       decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
       ),
       child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: constraints.maxWidth * percent,
        decoration: BoxDecoration(
         color: Colors.grey,
         borderRadius: BorderRadius.circular(15)
        )
       )
      );
     }
    );
   }
 }