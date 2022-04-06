import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {

    final String title = 'Frutas & vegetales';

    const CustomAppBar({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Container(
          height: kToolbarHeight,
          color: Colors.white,
          child: Row(
            children: [
              const BackButton(
                color: Colors.black
              ),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23
                  )
                ),
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: (){

                }
              ),
            ],
          )
         );
    }
  }