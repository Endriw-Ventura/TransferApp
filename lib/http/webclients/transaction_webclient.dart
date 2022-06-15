import 'dart:convert';
import 'package:cursoflutter/models/transaction.dart';
import 'package:http/http.dart';
import 'package:cursoflutter/http/webclient.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response =
    await client.get(Uri.parse(baseUrl)).timeout(Duration(seconds: 30));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(Uri.parse(baseUrl),
        headers: {
          'Content-type': 'application/json',
          'password': '1000',
        },
        body: transactionJson);

    return Transaction.fromJson(jsonDecode(response.body));
  }

}

