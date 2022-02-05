import 'package:cursoflutter/database/dao/contact/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final String dbName = 'bytebank.db';
  final String path = join(await getDatabasesPath(), dbName);
  return openDatabase(path,
    onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}


