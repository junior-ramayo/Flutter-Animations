import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/grocery-app/pages/home/widgets/custom_appbar.dart';
import 'package:retos_animaciones/animations/grocery-app/pages/home/widgets/groceryStoreCartList.dart';
import 'package:retos_animaciones/animations/grocery-app/pages/home/widgets/groceryStoreList.dart';
import 'package:retos_animaciones/animations/grocery-app/state/grocery_store_bloc.dart';
import 'package:retos_animaciones/animations/grocery-app/widgets/inherited_widget.dart';


 class GroceryStoreHome extends StatefulWidget {
  
  const GroceryStoreHome({Key? key}) : super(key: key);

  @override
  State<GroceryStoreHome> createState() => _GroceryStoreHomeState();
}

class _GroceryStoreHomeState extends State<GroceryStoreHome> {

  static const double cartBarHeight = 100;
  final bloc = GroceryStoreBloc();

  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
   return GroceryProvider(
    bloc: bloc,
    child: AnimatedBuilder(
     animation: bloc,
     builder: (context, _) {
      return Scaffold(
       backgroundColor: Colors.black,
       body: SafeArea(
        child: Stack(
         children: [
          AnimatedPositioned(
           duration: const Duration(milliseconds: 700),
           curve: Curves.decelerate,
           left: 0,
           right: 0,
           top: getTopForWhitePanel(bloc.groceryState, size),
           height: size.height - kToolbarHeight,
           child: ClipRRect(
             borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)
             ),
             child: Container(
              decoration: const BoxDecoration(
               color: Colors.white,
              ),
              child: const GroceryStoreList(),
             ),
           ),
          ),
          AnimatedPositioned(
           duration: const Duration(milliseconds: 700),
           curve: Curves.decelerate,
           left: 0,
           right: 0,
           top: getTopForBlackPanel(bloc.groceryState, size),
           height: size.height - kToolbarHeight,
           child: GestureDetector(
            onVerticalDragUpdate: _onVerticalGesture,
            child: Container(
             color: Colors.black,
             child: Column(
              children: [
               Padding(
                padding: const EdgeInsets.all(25.0),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: bloc.groceryState == GroceryState.normal ? Row(
                   children: [
                    const Text(
                     'Cart',
                     style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20
                     )
                    ),
                    Expanded(
                     child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                         bloc.cart.length, 
                         (index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Hero(
                              tag: 'list_${bloc.cart[index].product.name}details',
                              child: CircleAvatar(
                               backgroundColor: Colors.white,
                               backgroundImage: AssetImage(
                                bloc.cart[index].product.image
                               ),
                              ),
                            ),
                          );
                         }
                        ),
                      ),
                     )
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Center(child: Text(bloc.totalCartElement().toString())),
                    ),
                   ],
                  ) 
                  : const SizedBox.shrink(),
                ),
               ),
               const Expanded(child: GroceryStoreCartList()),
              ],
             ),
            ),
           ),
          ),
          AnimatedPositioned(
           duration: const Duration(milliseconds: 700),
           curve: Curves.decelerate,
           left: 0,
           right: 0,
           top: getTopForAppbar(bloc.groceryState),
           child: const CustomAppBar()
          ),
         ],
        ),
       ),
      );
     }
    ),
   );
  }

  void _onVerticalGesture(DragUpdateDetails details){
   if(details.primaryDelta! < -7){
    bloc.changeToCart();
   } else if(details.primaryDelta! > 12){
    bloc.changeToNormal();
   }
  }

  double getTopForWhitePanel(GroceryState state, Size size){
   if(state == GroceryState.normal){
     return - cartBarHeight + kToolbarHeight;
   } else if(state == GroceryState.cart){
     return - (size.height - kToolbarHeight - cartBarHeight / 2);
   } else {
     return 0.0;
   }
  }

  double getTopForBlackPanel(GroceryState state, Size size){
   if(state == GroceryState.normal){
     return size.height - cartBarHeight;
   } else if(state == GroceryState.cart){
     return cartBarHeight / 2;
   } else {
     return 0.0;
   }
  }

  double getTopForAppbar(GroceryState state,){
   if(state == GroceryState.normal){
     return 0.0;
   } else if(state == GroceryState.cart){
     return - cartBarHeight;
   } else {
     return 0.0;
   }
  }

}