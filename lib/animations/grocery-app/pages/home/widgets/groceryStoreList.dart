import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/grocery-app/widgets/inherited_widget.dart';
import 'package:retos_animaciones/animations/grocery-app/widgets/stoggeredDualView.dart';


 class GroceryStoreList extends StatelessWidget {
  
  const GroceryStoreList({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
   final bloc = GroceryProvider.of(context)?.bloc;
   return Container(
     color: const Color(0xFFF6F5F2),
     padding: const EdgeInsets.only(top: 100),
     child: StoggeredDualView(
      itemCount: bloc!.catalog.length,
      aspectRatio: 0.65,
      offsetPercent: 0.3,
      itemBuilder: (context, index){
       return Item(
         product: bloc.catalog[index],
       );
      }, 
     ),
   );
  }
 }