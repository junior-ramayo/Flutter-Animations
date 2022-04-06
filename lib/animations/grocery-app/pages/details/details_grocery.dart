import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/grocery-app/models/product/product.dart';

 class GroceryDetails extends StatefulWidget {

  final GroceryProduct product;
  final VoidCallback? onProductAdded;
  
  const GroceryDetails({Key? key, this.onProductAdded, required this.product}) : super(key: key);

  @override
  State<GroceryDetails> createState() => _GroceryDetailsState();
}

class _GroceryDetailsState extends State<GroceryDetails> {

  String heroTag = '';

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
     leading: const BackButton(
      color: Colors.black
     ),
     backgroundColor: Colors.white,
     elevation: 0,
    ),
    body: Column(
     children: [
      Expanded(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 25.0),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Hero(
            tag: 'list_${widget.product.name}$heroTag',
            child: Image.asset(
             widget.product.image,
             fit: BoxFit.cover,
             height: MediaQuery.of(context).size.height * 0.25,
            ),
           ),
           Text(
            widget.product.name,
            style: const TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 35
            ),
           ),
           const SizedBox(height: 7),
           Text(
            widget.product.weight,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
             color: Colors.grey,
            ),
           ),
           const SizedBox(height: 15),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300]!,
                  borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                 children: const [
                   Icon(Icons.remove),
                   SizedBox(width: 5),
                   Text('1'),
                   SizedBox(width: 5),
                   Icon(Icons.add),
                 ],
                ),
              ),
              Text(
               '\$ ${widget.product.price}',
               style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45
               ),
              )
            ],
           ),
           const SizedBox(height: 15),
           Container(
             margin: const EdgeInsets.only(top: 25),
             child: Text(
              'About the product',
              style: Theme.of(context).textTheme.headline5!.copyWith(
               fontWeight: FontWeight.bold
              ),
             ),
           ),
           const SizedBox(height: 15),
           Text(
            widget.product.description,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
             fontWeight: FontWeight.w200
            ),
           ),
          ],
         ),
       ),
      ),
      Row(
       children: [
        Container(
         padding: const EdgeInsets.all(8),
         margin: const EdgeInsets.only(left: 10),
         decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[350]
         ),
         child: const Icon(
           Icons.favorite_border,
           color: Colors.black
         ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => _addToCart(context),
            child: Container(
             margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
             padding: const EdgeInsets.symmetric(vertical: 11),
             decoration: BoxDecoration(
              color: Colors.orange[400],
              borderRadius: const BorderRadius.all(Radius.circular(20))
             ),
             child: const Center(
              child: Text(
               'Add to cart',
               style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19
               ),
              )
            ),
            ),
          ),
        )
       ],
      ),
     ],
    ),
   );
  }

  void _addToCart(BuildContext context){
   setState(() {
    heroTag = 'details';
   });
   widget.onProductAdded!();
   Navigator.of(context).pop();
  }
}