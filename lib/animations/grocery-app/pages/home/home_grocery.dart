import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/grocery-app/models/product/product.dart';
import 'package:retos_animaciones/animations/grocery-app/pages/details/details_grocery.dart';
import 'package:retos_animaciones/animations/grocery-app/pages/home/widgets/custom_appbar.dart';
import 'package:retos_animaciones/animations/grocery-app/state/grocery_store_bloc.dart';


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
           height: size.height,
           child: GestureDetector(
            onVerticalDragUpdate: _onVerticalGesture,
            child: Container(
             color: Colors.black,
             child: Column(
              children: [
               Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
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
                ),
               ),
                const Spacer(),
                const Placeholder()
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



 class GroceryProvider extends InheritedWidget {

  final GroceryStoreBloc bloc;
  final Widget child;

  const GroceryProvider({Key? key, required this.bloc, required this.child}) : super(key: key, child: child);

  static GroceryProvider? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<GroceryProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
   
 }


 
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