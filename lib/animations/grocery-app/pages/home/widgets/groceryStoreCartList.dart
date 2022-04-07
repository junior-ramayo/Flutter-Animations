import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/grocery-app/widgets/inherited_widget.dart';


 class GroceryStoreCartList extends StatelessWidget {
  
  const GroceryStoreCartList({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
   final bloc = GroceryProvider.of(context)!.bloc;
   return Padding(
     padding: const EdgeInsets.all(15.0),
     child: Column(
      children: [
        Expanded(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text(
            'Cart',
            style: TextStyle(
             color: Colors.white,
             fontSize: 35,
             fontWeight: FontWeight.bold
            ),
           ),
           Expanded(
            child: ListView.builder(
             itemCount: bloc.cart.length,
             itemBuilder: (context, index){
              final item = bloc.cart[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Row(
                  children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 15.0),
                     child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(
                       bloc.cart[index].product.image
                      ),
                     ),
                   ),
                   Text(
                    '${item.quantity} x',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                     child: Text(
                      bloc.cart[index].product.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                      ),
                     ),
                   ),
                   const Spacer(),
                   Text(
                     (item.product.price * item.quantity).toStringAsFixed(2),
                     style: const TextStyle(
                      color: Colors.white
                    ),
                   ),
                  ],
                ),
              );
             }
            ),
           ),
          ],
         ),
        ),
        Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
          const Text(
            'Total:',
            style: TextStyle(
             color: Colors.white,
             fontWeight: FontWeight.bold,
             fontSize: 25
            ),
          ),
          Text(
            '\$ ${bloc.totalPriceElements()}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600
            ),
          ),
         ],
        ),
        GestureDetector(
         onTap: () {},
         child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          padding: const EdgeInsets.symmetric(vertical: 11),
          decoration: BoxDecoration(
           color: Colors.orange[400],
           borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
          child: const Center(
           child: Text(
            'Next',
            style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 19
            ),
           )
          ),
         ),
        ),

      ],
     ),
   );
  }
 }