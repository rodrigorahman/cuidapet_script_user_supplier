import 'package:mysql1/mysql1.dart';
import 'package:script/application/database_connection.dart';
import 'package:script/model/supplier.dart';

class SupplierRepository {
  Future<List<Supplier>> findAll() async {
    MySqlConnection? conn;
    try {
      final conn = await DatabaseConnection().open();
      final result = await conn.query('select id, nome, logo from fornecedor');
      return result.map((e) => Supplier(e['id'], e['nome'], (e['logo'] as Blob).toString())).toList();
    } catch (e, s) {
      print(e);
      print(s);
      return [];
    }finally {
      await conn?.close();
    }
  }
}
