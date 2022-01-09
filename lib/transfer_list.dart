import 'package:cursoflutter/transfer.dart';
import 'package:cursoflutter/transfer_item.dart';
import 'package:flutter/material.dart';

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TransferItem(Transfer('100.0', '12345-6'),
        ),
      ],
    );
  }
}
