import 'dart:convert';
import 'package:cursoflutter/models/transaction.dart';
import 'package:http/http.dart';
import 'package:cursoflutter/http/webclient.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response =
    await client.get(Uri.parse(baseUrl));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(Uri.parse(baseUrl),
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    if (response.statusCode == 200)
      return Transaction.fromJson(jsonDecode(response.body));
    else {
      HttpException(_getMessage(response.statusCode));
      return Transaction.fromJson(jsonDecode(response.body));
    }
  }

  String _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode]!;
    }
    return 'Unknown Error';
  }

  static final Map<int, String> _statusCodeResponses = {
    400 : 'There was an error submitting transaction',
    401 : 'Authentication failed',
    409: 'Transaction already exists',
    500: 'Server Error',
  };

}
class HttpException implements Exception{
  final String message;
  HttpException(this.message);
}



