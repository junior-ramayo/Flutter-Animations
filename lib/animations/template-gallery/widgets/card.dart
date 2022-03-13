import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/template-gallery/models/contact.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    Key? key,
    required this.borderColor,
    required this.contact,
  }) : super(key: key);

  final Color borderColor;
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          heightFactor: .9,
          alignment: Alignment.centerLeft,
          child: Container(
            height: 30,
            width: 70,
            decoration: BoxDecoration(
              color: borderColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: borderColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  Row(
                    children: [
                      const  Icon(
                        Icons.person_outlined,
                        size: 40,
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text.rich(
                          TextSpan(
                            text: contact.name,
                            children: [
                              TextSpan(
                                text: '\n${contact.role}',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5,),
                              )
                            ],
                          ),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500,),
                        ),
                      ),
                    ],
                  ),
                 
                  Row(
                    children: [
                      const Icon(
                        Icons.home_outlined,
                        size: 40,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        contact.address,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.deepPurple,
                        ),
                      )
                    ],
                  ),
              
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_outlined,
                        size: 40,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        contact.phone,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold,),
                      )
                    ],
                  ),
                  
                  Row(
                    children: [
                      const Icon(
                        Icons.email_outlined,
                        size: 40,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contact.email,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.deepPurple,
                            ),
                          ),
                          Text(
                            contact.website,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SuperHeroCard extends StatelessWidget {
  const SuperHeroCard({Key?  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}