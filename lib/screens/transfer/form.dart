import 'package:cursoflutter/models/transfer.dart';
import 'package:flutter/material.dart';
import '../../components/input_field.dart';

class TransferForm extends StatelessWidget {

  final TextEditingController _controllerAccount = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();
  String _title = 'Transfer Form Settings';
  String _accountHint = '00000-0';
  String _accountLabel = 'Account Number';
  String _valueHint = '00.00';
  String _valueLabel = 'Value';
  String _buttonSubmit = 'Submit';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        children: [
          InputField(controller: _controllerAccount,
              hint: _accountHint,
              label: _accountLabel,
              icon: Icons.account_circle_rounded),
          InputField(controller: _controllerValue,
              hint: _valueHint,
              label: _valueLabel,
              icon: Icons.monetization_on),
          ElevatedButton(
            onPressed: () => _TransferCreation(context), child: Text(_buttonSubmit),
          ),
        ],
      ),
    );
  }

  void _TransferCreation(BuildContext context) {
    final double? value = double.tryParse(_controllerValue.text);
    final int? account = int.tryParse(_controllerAccount.text);
    if (value != null && account != null) {
      final newTransfer = Transfer(value, account);
      Navigator.pop(context, newTransfer);
    }
  }
}


