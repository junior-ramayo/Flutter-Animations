import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/grocery-app/models/product/product.dart';
import 'package:retos_animaciones/animations/grocery-app/pages/details/details_grocery.dart';
import 'package:retos_animaciones/animations/grocery-app/widgets/inherited_widget.dart';


 class StoggeredDualView extends StatelessWidget {
  
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing;
  final double aspectRatio;
  final double offsetPercent;
  
  const StoggeredDualView({
   Key? key, 
   required this.itemBuilder, 
   required this.itemCount, 
   this.spacing = 0.0, 
   this.aspectRatio = 0.5,
   this.offsetPercent = 0.5
  }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
    return LayoutBuilder(
     builder: (context, constraints){
      final width = constraints.maxWidth;
      final itemHeight = (width * 0.5) / aspectRatio;
      final heigth = constraints.maxHeight + itemHeight;
      return OverflowBox(
       maxWidth: width,
       minWidth: width,
       maxHeight: heigth,
       minHeight: heigth,
       child: GridView.builder(
        padding: EdgeInsets.only(top: itemHeight / 2, bottom: itemHeight, left: 15, right: 15),
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
         childAspectRatio: aspectRatio,
         crossAxisSpacing: spacing,
         mainAxisSpacing: spacing
        ),
        itemBuilder: (context, index){
          return Transform.translate(
           offset: Offset(0.0, index.isOdd ? itemHeight * offsetPercent : 0.0),
           child: itemBuilder(context, index),
          );
        }
       ),
      );
     }
    );
   }
 }

  class Item extends StatelessWidget {

  final GroceryProduct product;

   const Item({
    Key? key, 
    required this.product
   }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context)?.bloc;
    return GestureDetector(
     onTap: (){
      Navigator.of(context).push(
       PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, _){
         return FadeTransition(
          opacity: animation,
          child: GroceryDetails(
           product: product,
           onProductAdded: (){
             bloc!.addProduct(product);
           }
          )
         );
        }
       )
      );
     },
     child: Card(
      shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(30)
      ),
       elevation: 4,
       shadowColor: Colors.black26,
       child: Padding(
         padding: const EdgeInsets.all(12.0),
         child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           Expanded(
            child: Hero(
              tag: 'list_${product.name}',
              child: Image.asset(
               product.image,
               fit: BoxFit.contain
              ),
            )
           ),
           const SizedBox(height: 10),
           Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             Text(
              product.name,
              maxLines: 2,
              style: const TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 13
              ),
             ),
             const SizedBox(height: 7),
             Text(
              product.weight,
              style: const TextStyle(
               fontWeight: FontWeight.w300,
               fontSize: 11,
               color: Colors.grey
              ),
             ),
             const SizedBox(height: 7),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: List.generate(
                5, 
                (index){
                 return const Icon(
                  Icons.star,
                  color: Colors.yellow
                 );
                }
               ),
             ),
            ],
           ),
          ],
         ),
       ),
      ),
    );
   }
 }