import 'package:cursoflutter/trasfer_from.dart';
import 'package:flutter/material.dart';

class ByteBank extends StatelessWidget {
  const ByteBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: TransferForm() //TransferList(),
      ),
    );
  }
}


