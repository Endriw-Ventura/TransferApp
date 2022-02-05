import 'package:cursoflutter/components/input_field_number.dart';
import 'package:cursoflutter/components/input_field_text.dart';
import 'package:cursoflutter/database/dao/contact/contact_dao.dart';
import 'package:cursoflutter/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatelessWidget {

  final TextEditingController _controllerAccount = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();
  final String _title = 'New Contact';
  final String _nameHint = 'Enter Name';
  final String _nameLabel = 'Name';
  final String _accountHint = '00000-0';
  final String _accountLabel = 'Account';
  final String _buttonSubmit = 'Submit';
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        children: [
          InputFieldText(controller: _controllerAccount,
              hint: _nameHint,
              label: _nameLabel,
              icon: Icons.account_circle_rounded,
          ),
          InputFieldNumber(controller: _controllerValue,
            hint: _accountHint,
            label: _accountLabel,
            icon: Icons.account_balance_wallet,
            maxLength: 6,
          ),
          ElevatedButton(
            onPressed: () => _contactCreation(context),
            child: Text(_buttonSubmit),
          ),
        ],
      ),
    );
  }

  void _contactCreation(BuildContext context) {
    final int? account = int.tryParse(_controllerValue.text);
    final String? name = _controllerAccount.text;
    if (name != null && account != null) {
      final newContact = Contact(0, name, account);
      _dao.save(newContact).then((id) => Navigator.pop(context));
    }
  }
}