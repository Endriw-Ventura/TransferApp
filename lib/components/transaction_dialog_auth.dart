import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {

  const TransactionAuthDialog({Key? key, required this.onConfirm}) : super(key: key);
  final Function(String password) onConfirm;

  @override
  _TransactionAuthDialogState createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {

  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        controller: _passwordController,
        keyboardType: TextInputType.number,
        maxLength: 4,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 64,
          letterSpacing: 24,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green[800]),
              ),
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel',
              style: TextStyle(
                color: Colors.white
              ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green[800]),
              ),
              onPressed: () {
                widget.onConfirm(_passwordController.text);
                Navigator.pop(context);
              },
              child: Text('Confirm',
                  style: TextStyle(
                      color: Colors.white
                  ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
