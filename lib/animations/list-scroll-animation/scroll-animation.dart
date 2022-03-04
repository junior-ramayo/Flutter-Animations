import 'package:flutter/material.dart';


 class ListScrollAnimation extends StatefulWidget {
   ListScrollAnimation({Key? key}) : super(key: key);
 
   @override
   State<ListScrollAnimation> createState() => _ListScrollAnimationState();
 }
 
 class _ListScrollAnimationState extends State<ListScrollAnimation> {


  final scrollController = ScrollController();
  List<int> lista = [0, 1, 2, 3, 4, 5,6,7, 8, 9, 10];
  List colores = [Colors.blue, Colors.amber, Colors.red, Colors.pink, Colors.orange, Colors.blue, Colors.amber, Colors.red, Colors.pink, Colors.orange, Colors.red];
  final itemSize = 150.0;

  @override
  void initState() {
    scrollController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(),
    body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: CustomScrollView(
       controller: scrollController,
       slivers: [
        const SliverAppBar(
         automaticallyImplyLeading: false,
         title: Text('My Cards', style: TextStyle(color: Colors.black)),
         pinned: true,
         backgroundColor: Colors.transparent,
         elevation: 0,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 50,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
           (context, index){
            final itemPositionOffset = index * itemSize / 2;
            final difference = scrollController.offset - itemPositionOffset;
            final percent = 1.2 - (difference / (itemSize / 2));
            double opacity = percent;
            if(opacity > 1.0) opacity = 1.0;
            if(opacity < 0.0) opacity = 0.0;
            return Align(
              heightFactor: 0.7,
              child: Opacity(
                opacity: opacity,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..scale(opacity, 1.0),
                  child: Card(
                   shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(20.0),
                     topRight: Radius.circular(20.0)
                    )
                   ),
                   color: colores[index],
                   child: SizedBox(
                    height: itemSize,
                    child: Row(
                     children:[
                      Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(15.0),
                         child: Text(
                          'texto $index',
                          style: const TextStyle(
                           color: Colors.white,
                           fontSize: 25
                          ),
                         ),
                       )
                      ),
                     ],
                    ),
                   ),
                  ),
                ),
              ),
            );
           },
           childCount: lista.length,
          )
         ),
       
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 250,
          ),
        ),
       ],
      ),
    ),
   );
  }



  void onListen(){
   setState(() {
     
   });
  }


 }