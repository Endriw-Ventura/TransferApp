import 'package:cursoflutter/database/app_database.dart';
import 'package:cursoflutter/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {

  static const String tableSql = 'CREATE TABLE contacts('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'account_number INTEGER)';
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';


  Future<int> save(Contact contact) async {
    final Database db = await createDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
     final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contact> contacts = _toList(result);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
     final List<Contact> contacts = [];
    for (Map<String, dynamic> map in result) {
      final Contact contact = Contact(
        map[_id],
        map[_name],
        map[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}