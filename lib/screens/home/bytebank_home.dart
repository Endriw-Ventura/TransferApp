import 'package:cursoflutter/components/home_button.dart';
import 'package:cursoflutter/screens/contacts/list.dart';
import 'package:cursoflutter/screens/transfer/list.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network('https://cdn.pixabay.com/photo/2022/01/04/18/47/oil-6915740_960_720.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/bytebank.jpg'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeButton(icon: Icons.people,
                title: 'Contacts',
                route: ContactsList(),
              ),
              HomeButton(icon: Icons.monetization_on_outlined,
                title: 'Transfers',
                route: TransferList(),
              ),
              HomeButton(icon: Icons.arrow_forward_sharp,
                title: 'Menu',
                route: ContactsList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


