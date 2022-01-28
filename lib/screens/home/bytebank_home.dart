import 'package:flutter/material.dart';

class BytebankHome extends StatelessWidget {
  const BytebankHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          Image.network('https://cdn.pixabay.com/photo/2022/01/04/18/47/oil-6915740_960_720.jpg'),
          Image.asset('images/bytebankExample.jpg'),
        ],
      ),
    );
  }
}
