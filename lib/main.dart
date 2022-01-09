import 'package:cursoflutter/transfer_list.dart';
import 'package:flutter/material.dart';
String valueMoney = '100.0';
String accountNumber = '152465854-5';
void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Transfer'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child: Icon(Icons.add),
        ),
        body: TransferList(),
      ),
  ),
);


