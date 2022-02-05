import 'package:cursoflutter/models/contact.dart';
import 'package:cursoflutter/screens/contacts/form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  List<Contact> _contactList = [];

  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView(
       children:[
         Card(
           child: ListTile(
             title: Text('example',
             style: TextStyle(
               fontSize: 24.0,
             ),
             ),
             subtitle: Text('example'),
           ),
         ),
       ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Contact?> future = Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return ContactForm();
            }),
          );
          future.then((createdContact){
            if(createdContact != null){
              setState(() {
                widget._contactList.add(createdContact);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
