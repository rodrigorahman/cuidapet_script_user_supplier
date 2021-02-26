import 'dart:io';

import 'package:script/model/supplier.dart';
import 'package:script/repository/supplier_repository.dart';
import 'package:sprintf/sprintf.dart';

Future<void> run() async {
  final suppliers = await SupplierRepository().findAll();

  if (suppliers.isNotEmpty) {
    final valuesQuery = suppliers.map(printQuery).join(',\n');
    final userQuery = 'INSERT INTO usuario(id,email,senha,tipo_cadastro,ios_token,android_token,refresh_token,img_avatar, fornecedor_id) VALUES\n%s;';

    print(sprintf(userQuery, [valuesQuery]));
    exit(0);
  }
}

String printQuery(Supplier supplier) {
  final value = '(null,\'%s\',\'96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e\',\'APP\',null,null,null,\'%s\',%s)';
  final email = '${supplier.name.toLowerCase().replaceAll(' ', '')}@gmail.com';

  return sprintf(value, [email, supplier.logo, supplier.id]);
}
