import 'package:flutter/material.dart';
import 'package:retos_animaciones/animations/template-gallery/models/contact.dart';
import 'package:retos_animaciones/animations/template-gallery/widgets/card.dart';
import 'package:retos_animaciones/animations/template-gallery/widgets/page-view-list.dart';

 class ContactListPage extends StatefulWidget {
   ContactListPage({Key? key}) : super(key: key);
 
   @override
   State<ContactListPage> createState() => _ContactListPageState();
 }
 
 class _ContactListPageState extends State<ContactListPage> {
   
   
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: appBar(),
    body: PerspectiveList(
      itemExtent: MediaQuery.of(context).size.height * .36, 
      visializedItems: 8,
      initialIndex: 7,
      padding: const EdgeInsets.all(10.0),
      children: List.generate(
       Contact.contacts.length, 
       (index) {
        final borderColor = Colors.accents[index % Colors.accents.length];
        final contact = Contact.contacts[index];
        return ContactCard(
         borderColor: borderColor, 
         contact: contact
        );
       }
      ),
    ) 
   );
  }

  AppBar appBar(){
   return AppBar(
    title: const Text('Template Gallery'),
    leading: IconButton(
     onPressed: (){},
     icon: const Icon(Icons.menu)
    ),
    actions: [
     IconButton(
      onPressed: (){}, 
      icon: const Icon(Icons.search)
     )
    ],
    shape: const RoundedRectangleBorder(
     borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(20.0)
     ),
    ),
   );
  }

 }