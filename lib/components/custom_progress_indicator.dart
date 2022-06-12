import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final String message;
  CustomProgressIndicator({this.message = 'Loading'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(message),
        ],
      ),
    );
  }
}
