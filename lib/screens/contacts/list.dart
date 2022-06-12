import 'package:cursoflutter/components/custom_progress_indicator.dart';
import 'package:cursoflutter/database/dao/contact/contact_dao.dart';
import 'package:cursoflutter/models/contact.dart';
import 'package:cursoflutter/screens/contacts/form.dart';
import 'package:cursoflutter/screens/contacts/item.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
          future: _dao.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;

              case ConnectionState.waiting:
                return CustomProgressIndicator(message: 'Loading Contacts');

              case ConnectionState.active:
                break;

              case ConnectionState.done:
                final List<Contact?> contacts = snapshot.data!;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index]!;
                    return ContactItem(contact);
                  },
                  itemCount: contacts.length,
                );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Unknown Error'),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactForm(),
            ),
          ).then((value) => setState(() {}),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
