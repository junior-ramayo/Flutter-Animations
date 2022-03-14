import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/tabs-synchronization/bloc/bloc.dart';
import 'package:retos_animaciones/animations/tabs-synchronization/data/data.dart';


 class TabsSynchronization extends StatefulWidget {
   const TabsSynchronization({Key? key}) : super(key: key);
 
   @override
   State<TabsSynchronization> createState() => _TabsSynchronizationState();
 }
 
 class _TabsSynchronizationState extends State<TabsSynchronization> with SingleTickerProviderStateMixin{
   
  final _backgroundColor = const Color(0xFFF6F9FA);
  final _blueColor = const Color(0xFF0D1863);
  final _greenColor = const Color(0xFF2BBEBA);

  final bloc = DeliveryBloc();
   

  @override
  void initState() {
    bloc.init(this);
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
   
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: _backgroundColor,
    body: SafeArea(
      child: AnimatedBuilder(
        animation: bloc,
        builder: (_, __) => Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
          
          header(),
          
          Container(
            height: 60,
            color: Colors.white,
            child: TabBar(
             onTap: bloc.onCategorySelected,
             controller: bloc.tabController,
             indicatorWeight: 0.01,
             isScrollable: true,
             tabs: bloc.tabs.map((e) => TabWidget(tabCategory: e)).toList()
            ),
          ),
          
          Expanded(
           child: Container(
             child: ListView.builder(
              controller: bloc.scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: bloc.items.length,
              itemBuilder: (context, index){
                final item = bloc.items[index];
               if(item.isCategory){ //si index es impar
                return CategoryItem(category: item.category);
               } else {
                return ProductItem(product: item.product);
               }
              }
             ),
           )
          ),
          
          
         ],
        ),
      ),
    ),
   );
  }

  Widget header(){
    return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white,
          height: 70,
          child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
            Text(
             'HomePage',
             style: TextStyle(
              color: _blueColor,
              fontSize: 20,
              fontWeight: FontWeight.bold
             ),
            ),
            CircleAvatar(
             backgroundColor: _greenColor,
             radius: 20,
             child: ClipOval(
              child: Image.asset(
                'assets/avatar-1.png',
                fit: BoxFit.cover,
                height: 40,
              ),
             ),
            )
           ],
          ),
        );
  }

  

 }

 class CategoryItem extends StatelessWidget {
   
   final Category? category;
   
   const CategoryItem({Key? key,  this.category}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Container(
      height: categoryHeight,
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: Text(
       category!.name,
       style: const TextStyle(
              color: Color(0xFF0D1863),
              fontSize: 20,
              fontWeight: FontWeight.bold
       ),
      ),
     );
   }
 }

 class ProductItem extends StatelessWidget {

  final Product? product;
   
  const ProductItem({Key? key, this.product}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
   return Container(
    margin: const EdgeInsets.symmetric(vertical: 5),
    height: productHeight,
    child: Card(
     elevation: 6,
     shadowColor: Colors.black54,
     shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12)
     ),
     child: Row(
      children: [

       Padding(
         padding: const EdgeInsets.all(10.0),
         child: Image.asset(product!.image),
       ),

       Expanded(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text(
            product!.name,
            style: const TextStyle(
             color: Color(0xFF0D1863),
             fontSize: 14,
             fontWeight: FontWeight.bold
            ),
           ),
           const SizedBox(height: 5),
           Text(
            product!.description,
            maxLines: 2,
            style: const TextStyle(
             color: Color(0xFF0D1863),
             fontSize: 13,
            ),
           ),
           const SizedBox(height: 7),
           Text(
            '\$${product!.price.toStringAsFixed(2)}',
            style: const TextStyle(
             color: Color(0xFF2BBEBA),
             fontSize: 14,
             fontWeight: FontWeight.bold
            ),
           ),
          ],
         ),
       ),

      ],
     ),
    ),
   );
  }
 }

 class TabWidget extends StatelessWidget {
  
   final TabCategory tabCategory;
 
   const TabWidget({Key? key, required this.tabCategory}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Opacity(
       opacity: tabCategory.selected ? 1 : 0.5,
       child: Card(
         elevation: tabCategory.selected ? 6 : 0,
         child: Padding(
           padding: const EdgeInsets.all(6.0),
           child: Text(
             tabCategory.category.name,
             style: const TextStyle(
               color: Color(0xFF0D1863),
               fontWeight: FontWeight.bold,
               fontSize: 13
             )
           ),
         )
       ),
     );
   }
 }