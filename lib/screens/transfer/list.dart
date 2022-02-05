import 'package:cursoflutter/models/transfer.dart';
import 'package:cursoflutter/screens/transfer/item.dart';
import 'package:cursoflutter/screens/transfer/form.dart';
import 'package:flutter/material.dart';

class TransferList extends StatefulWidget {
  final List<Transfer> _transferList = [];

  @override
  _TransferListState createState() => _TransferListState();
}

class _TransferListState extends State<TransferList> {
  String  _title = 'Transfer List';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(_title),
      ),
      body: ListView.builder(
        itemCount: widget._transferList.length,
        itemBuilder: (context, int index) {
          final transfer = widget._transferList[index];
          return TransferItem(transfer);
        }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transfer?> future = Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return TransferForm();
            }),
          );
          future.then((receivedTransfer){
            if(receivedTransfer != null){
              setState(() {
                widget._transferList.add(receivedTransfer);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
