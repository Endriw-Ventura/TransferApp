import 'package:cursoflutter/screens/home/bytebank_home.dart';
import 'package:flutter/material.dart';

class ByteBank extends StatelessWidget {

  const ByteBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.cyan[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.cyan[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BytebankHome(),
      //home: TransferList(), //TransferList(),
    );
  }
}


