import 'package:cursoflutter/transfer.dart';
import 'package:cursoflutter/transfer_item.dart';
import 'package:flutter/material.dart';

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Transfer'),
      ),
      body: Column(
        children: [
          TransferItem(Transfer(100.0, 125365),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
