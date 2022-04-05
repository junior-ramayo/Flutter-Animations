import 'package:flutter/material.dart';


class CoffeeTemperatures extends StatelessWidget {

  const CoffeeTemperatures({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.white, 
              boxShadow: [
              BoxShadow(
                  color: Colors.black12, 
                  blurRadius: 10, 
                  offset: Offset(3, 10)
              )
            ]),
            child: Text(
              'Hot | Warm',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.brown[700]),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              'Cold | Ice',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.grey[400]),
            ),
          ),
        ),
      ],
    );
  }
}