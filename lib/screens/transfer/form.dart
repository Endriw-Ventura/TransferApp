import 'package:cursoflutter/components/input_field_number.dart';
import 'package:cursoflutter/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatelessWidget {

  final TextEditingController _controllerAccount = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();
  final String _title = 'Transfer Form Settings';
  final String _accountHint = '00000-0';
  final String _accountLabel = 'Account Number';
  final String _valueHint = '00.00';
  final String _valueLabel = 'Value';
  final String _buttonSubmit = 'Submit';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        children: [
          InputFieldNumber(controller: _controllerAccount,
            hint: _accountHint,
            label: _accountLabel,
            icon: Icons.account_circle_rounded,
            maxLength: 6,
          ),
          InputFieldNumber(controller: _controllerValue,
            hint: _valueHint,
            label: _valueLabel,
            icon: Icons.monetization_on,
            maxLength: 6,
          ),
          ElevatedButton(
            onPressed: () => _transferCreation(context),
            child: Text(_buttonSubmit),
          ),
        ],
      ),
    );
  }

  void _transferCreation(BuildContext context) {
    final double? value = double.tryParse(_controllerValue.text);
    final int? account = int.tryParse(_controllerAccount.text);
    if (value != null && account != null) {
      final newTransfer = Transfer(value, account);
      Navigator.pop(context, newTransfer);
    }
  }
}


