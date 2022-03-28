import 'package:flutter/material.dart';


 class SplashPage extends StatefulWidget {
   const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

 double scale = 4.0;

 @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) { 
      setState(() {
        scale = 1.0;
      });
    });
    super.initState();
  }

 @override
 Widget build(BuildContext context) {
  return Scaffold(
   body: Center(
    child: Stack(
     children: [

       AnimatedPositioned(
        duration: const Duration(seconds: 2),
        curve: Curves.bounceOut,
        height: getHeight(),
        width: getWidth(),
        top: MediaQuery.of(context).size.height / 2 - getHeight() / 2,
        left: MediaQuery.of(context).size.width / 2 - getWidth() / 2,
        onEnd: (){
          // Navigator.of(context).pushReplacement(
          //  MaterialPageRoute(
          //   builder: (_) => HomeScreen(),
          //  )
          // );
        },
        child: Container(
          height: 60,
          width: 60,
          color: Colors.blue,
        ),
       ),

     ]
    ),
   ),
  );
 }

 double getHeight(){
  return 100 * scale;
 }

 double getWidth(){
  return 160 * scale;
 }

}