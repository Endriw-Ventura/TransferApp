import 'package:cursoflutter/transfer.dart';
import 'package:flutter/material.dart';

class TransferItem extends StatelessWidget {

Transfer _transfer;

 TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value),
        subtitle: Text(_transfer.accountNumber),
      ),
    );
  }
}

