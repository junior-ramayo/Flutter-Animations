import 'dart:ui';
import 'package:flutter/material.dart';


class PerspectiveList extends StatefulWidget {

  const PerspectiveList({Key? key, 
   required this.children, 
   required this.itemExtent, 
   required this.visializedItems, 
   this.initialIndex = 0, 
   this.padding = const EdgeInsets.all(0.0), 
   this.onTapFrontItem, 
   this.onChangeItem, 
   this.backItemsShadowColor = Colors.black,
  }) : super(key: key);

  final List<Widget> children;
  final double itemExtent;
  final int visializedItems;
  final int initialIndex;
  final EdgeInsetsGeometry padding;
  final ValueChanged<int>? onTapFrontItem;
  final ValueChanged<int>? onChangeItem;
  final Color backItemsShadowColor;

  @override
  State<PerspectiveList> createState() => _PerspectiveListState();
}

class _PerspectiveListState extends State<PerspectiveList> {
  
  late PageController _pageController;
  late double _pagePercent;
  late int _currentIndex;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: widget.initialIndex,
      viewportFraction: 1 / widget.visializedItems
    );
    _currentIndex = widget.initialIndex;
    _pagePercent = 0.0;
    _pageController.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }
  
  
  @override
  Widget build(BuildContext context) {
   return Stack(
    children: [
      Padding(
       padding: widget.padding,
       child: _PerspectiveItems(
        generatedItems: widget.visializedItems - 1,
        index: _currentIndex,
        heightItem: widget.itemExtent,
        pagePercent: _pagePercent,
        children: widget.children
       ),
      ),
          
      PageView.builder(
       scrollDirection: Axis.vertical,
       controller: _pageController,
       physics: const BouncingScrollPhysics(),
       onPageChanged: (value){
        if(widget.onChangeItem != null){
         widget.onChangeItem!(value);
        }
       },
       itemCount: widget.children.length,
       itemBuilder: (context, index){
        return const SizedBox();
       }
      ),


     ],
   );
  }


  void _pageListener(){
    setState(() {
      _currentIndex = _pageController.page!.floor();
      _pagePercent = (_pageController.page! - _currentIndex).abs();
    });
  }
}

class _PerspectiveItems extends StatelessWidget {
  const _PerspectiveItems({
    Key? key,
    required this.generatedItems,
    required this.index,
    required this.heightItem,
    required this.pagePercent,
    required this.children,
  }) : super(key: key);

  final int generatedItems;
  final int? index;
  final double? heightItem;
  final double? pagePercent;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
       final height = constraints.maxHeight;
       return Stack(
        fit: StackFit.expand,
        children: [
        
        // Static Last Item
        if (index! > (generatedItems - 1)) 
        _TransformedItem(
         heightItem: heightItem,
         factorChange: 1,
         endScale: .5,
         child: children[index! - generatedItems],
        ) else const SizedBox(),
        
        // Perspective Items
        for (int i = 0; i < generatedItems; i++)
         (index! > ((generatedItems - 2) - i))
          ? _TransformedItem(
           heightItem: heightItem,
           factorChange: pagePercent,
           scale: lerpDouble(0.5, 1, (i + 1) / generatedItems),
           translateY: (height - heightItem!) * (i + 1) / generatedItems,
           endScale: lerpDouble(0.5, 1, i / generatedItems),
           endTranslateY: (height - heightItem!) * (i / generatedItems),
           child: children[
            index! - (((generatedItems - 2) - i) + 1)
           ],
          ) : const SizedBox(),
          
          // Bottom Hide Item
        if (index! < (children.length - 1)) 
         _TransformedItem(
         heightItem: heightItem,
         factorChange: pagePercent,
         translateY: height + 20,
         endTranslateY: height - heightItem!,
         child: children[index! + 1],
        ) else const SizedBox()
       ],
       );
      },
    );
  }
}

class _TransformedItem extends StatelessWidget {
  const _TransformedItem({
    Key? key,
    required this.heightItem,
    required this.child,
    required this.factorChange,
    this.endScale = 1.0,
    this.scale = 1.0,
    this.endTranslateY = 0.0,
    this.translateY = 0.0,
  }) : super(key: key);

  final Widget child;
  final double? heightItem;
  final double? factorChange;
  final double? endScale;
  final double endTranslateY;
  final double translateY;
  final double? scale;

  @override
  Widget build(BuildContext context) {
   return Transform(
    alignment: Alignment.topCenter,
    transform: Matrix4.identity()
    ..scale(lerpDouble(scale, endScale, factorChange!))
    ..translate(
     0.0, 
     lerpDouble(translateY, endTranslateY, factorChange!)!
    ),
    child: Align(
     alignment: Alignment.topCenter,
     child: SizedBox(
      height: heightItem,
      width: double.infinity,
      child: child,
     ),
    ),
   );
  }
}