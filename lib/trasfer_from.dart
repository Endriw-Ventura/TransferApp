import 'package:cursoflutter/transfer.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatelessWidget{

  final TextEditingController _controllerAccount = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
         title: Text('Transfer Form Settings'),
     ),
       body: Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(
               controller: _controllerAccount,
               keyboardType: TextInputType.number,
               maxLength: 6,
               style: TextStyle(
                 fontSize: 24
               ),
              decoration: InputDecoration(
                icon: Icon(Icons.account_box_rounded),
                labelText: 'Account Number',
                hintText: '000000',
              ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(
               controller: _controllerValue,
               keyboardType: TextInputType.number,
               style: TextStyle(
                   fontSize: 24
               ),
               decoration: InputDecoration(
                 icon: Icon(Icons.monetization_on),
                 labelText: 'Value',
                 hintText: '00.00'
               ),
             ),
           ),
           ElevatedButton(
             onPressed: (){
               final double? value = double.tryParse(_controllerValue.text);
               final int? account = int.tryParse(_controllerAccount.text);
               if(value != null && account != null){
                 Transfer(value, account);
               }
             }, child: Text('Submit'),
           )
         ],
       ));
  }

}