import 'package:flutter/material.dart';


class ColumnWidget extends AnimatedWidget {

  const ColumnWidget({
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

      _card('assets/avatar-1.png', 'Junior', 'Developer', '116', [Colors.orange, Colors.pinkAccent]),
      _card('assets/avatar-2.jpg', 'Domenica', 'Designer', '7', [Colors.green,Colors.blue[300]!]),
      _card('assets/avatar-2.jpg', 'Vanessa', 'nutritionist', '13', [Colors.purple[100]!, Colors.pinkAccent]),
      _card('assets/avatar-1.png', 'Antonio', 'counter', '25', [Colors.red[300]!, Colors.amberAccent[700]!]),
      _card('assets/avatar-1.png', 'Rodrigo', 'Designer', '25', [Colors.red[300]!, Colors.amberAccent[700]!]),
     
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