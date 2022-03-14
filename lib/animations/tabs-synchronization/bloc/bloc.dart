import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/tabs-synchronization/data/data.dart';
const categoryHeight = 55.0;
const productHeight = 100.0;

 class DeliveryBloc extends ChangeNotifier {

   List<TabCategory> tabs = [];
   List<DeliveryItem> items = [];
   late TabController tabController;
   ScrollController scrollController = ScrollController();
   bool listen = true;

   void init(TickerProvider ticker){
    tabController = TabController(vsync: ticker, length: categories.length);
    double offsetFrom = 0.0;
    double offsetTo = 0.0;
    for(int i = 0; i < categories.length; i++){
     final category = categories[i];
     if(i > 0){
      offsetFrom += categories[i - 1].products.length * productHeight;
     }
     if(i < categories.length - 1){
      offsetTo = offsetFrom + categories[i + 1].products.length * productHeight;
     } else {
      offsetTo = double.infinity;
     }
     tabs.add(
      TabCategory(
        category: category, 
        selected: (i == 0), 
        offsetFrom: categoryHeight * i + offsetFrom,
        offsetTo: offsetTo
      ));
     items.add(DeliveryItem(category: category));
     for(int j = 0; j < category.products.length; j++){
      final product = category.products[j];
      items.add(DeliveryItem(product: product));
     }
    }
    scrollController.addListener(onScrollListener);
   }

   void onScrollListener(){
    if(listen){
    for(int i = 0; i < tabs.length; i++){
     final tab = tabs[i];
     if(scrollController.offset >= tab.offsetFrom && scrollController.offset <= tab.offsetTo && !tab.selected){
      onCategorySelected(i, animationRequired: false);
      tabController.animateTo(i);
      break;
     }
    }
    }
   }

  void onCategorySelected(int index, {bool animationRequired = true}) async {
   final selected = tabs[index];
   for(int i = 0; i < tabs.length; i++){
     final condition = selected.category.name == tabs[i].category.name;
    tabs[i] = tabs[i].copyWith(condition);
   }
   notifyListeners();
   if(animationRequired){
    listen = false;
    await scrollController.animateTo(
     selected.offsetFrom, 
     duration: const Duration(milliseconds: 500), 
     curve: Curves.linear
    );
    listen = true;
   }
  }

  @override
  void dispose() {
    scrollController.removeListener(onScrollListener);
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }


}


class TabCategory {
  final Category category;
  final bool selected;
  final double offsetFrom;
  final double offsetTo;

  TabCategory copyWith(bool selected) => TabCategory(
    category: category, selected: selected, offsetFrom: offsetFrom, offsetTo: offsetTo);

  TabCategory({required this.category, required this.selected, required this.offsetFrom, required this.offsetTo});
}

class DeliveryItem {
  final Category? category;
  final Product? product;

  DeliveryItem({this.category, this.product});

  bool get isCategory => category != null;


}
