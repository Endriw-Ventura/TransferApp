import 'package:cursoflutter/components/centered_message.dart';
import 'package:cursoflutter/components/custom_progress_indicator.dart';
import 'package:cursoflutter/database/http/web_client.dart';
import 'package:cursoflutter/models/transfer.dart';
import 'package:cursoflutter/screens/transfer/item.dart';
import 'package:cursoflutter/screens/transfer/form.dart';
import 'package:flutter/material.dart';

class TransferList extends StatelessWidget {
  String _title = 'Transfer List';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(_title),
      ),
      body: FutureBuilder<List<Transfer>>(
          future: findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CustomProgressIndicator(message: 'Loading Transactions');
              case ConnectionState.none:
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final List<Transfer> _transferList = snapshot.data!;
                  if (_transferList.isNotEmpty) {
                    return ListView.builder(
                        itemCount: _transferList.length,
                        itemBuilder: (context, int index) {
                          final transfer = _transferList[index];
                          return TransferItem(transfer);
                        });
                  }
                }
                CenteredMessage('No Transactions Found', icon: Icons.warning);
                break;
            }
            return CenteredMessage('Unknown Error');
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transfer?> future = Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return TransferForm();
            }),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}






