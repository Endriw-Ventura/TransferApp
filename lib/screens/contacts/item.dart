import 'package:cursoflutter/models/contact.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {

  final Contact contact;
  ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contact.name!,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(contact.accountNumber.toString()),
      ),
    );
  }
}
