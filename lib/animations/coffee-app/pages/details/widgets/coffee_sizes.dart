import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retos_animaciones/animations/coffee-app/pages/details/coffee_details.dart';


class CoffeeSizeOption extends StatelessWidget {
  const CoffeeSizeOption({
    Key? key,
    required this.isSelected,
    required this.coffeeSize,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final CoffeeSize coffeeSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final labelSize = coffeeSize.toString().split('.')[1][0].toLowerCase();
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isSelected
              ? [Colors.brown, Colors.orange]
              : [Colors.grey[300]!, Colors.grey[300]!],
        ).createShader(bounds),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/coffee/$labelSize-coffee-cup.svg",
              width: 45.0,
              color: Colors.white,
            ),
            Text(
              labelSize.toUpperCase(),
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.white,
                  ),
            )
          ],
        ),
      ),
    );
  }
}