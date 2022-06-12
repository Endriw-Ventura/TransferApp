import 'dart:convert';
import 'package:cursoflutter/models/contact.dart';
import 'package:cursoflutter/models/transfer.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
 @override
 Future<RequestData> interceptRequest({required RequestData data}) async {
  print('URL: ${data.url}');
  print('body: ${data.body}');
  print('headers: ${data.headers}');
  return data;
 }

 @override
 Future<ResponseData> interceptResponse({required ResponseData data}) async {
  print('URL: ${data.url}');
  print('body: ${data.body}');
  print('headers: ${data.headers}');
  return data;
 }
}

Future<List<Transfer>> findAll() async {
 Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
 final Response response = await client.get(
     Uri.parse('http://192.168.0.111:8080/transactions')).timeout(Duration(seconds: 15));
 final List<dynamic> decodedJson = jsonDecode(response.body);
 final List<Transfer> transferencias = [];

 for (Map<String, dynamic> transactionJson in decodedJson) {
  final Map<String, dynamic> transactionContact = transactionJson['contact'];
  final Transfer newTransfer = Transfer(transactionJson['value'],
      Contact(0,
          transactionContact['name'],
          transactionContact['accountNumber'])
  );
  transferencias.add(newTransfer);
 }
 return transferencias;
}