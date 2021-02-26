import 'package:mysql1/mysql1.dart';
import 'package:dotenv/dotenv.dart' show env;

class DatabaseConnection {
  Future<MySqlConnection> open() async {
    return await MySqlConnection.connect(ConnectionSettings(
      host: env['host'],
      port: int.parse(env['port']!),
      user: env['user'],
      password: env['password'],
      db: env['databaseName'],
    ));
  }
}
