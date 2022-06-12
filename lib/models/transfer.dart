
import 'contact.dart';

class Transfer {
  final double? value;
  final Contact? contact;
  Transfer(this.value, this.contact);

  @override
  String toString() {
    return 'Transfer: {value: ${value}, contact: {name: ${contact!.name}, accountNumber: ${contact!.accountNumber}}';
  }
}