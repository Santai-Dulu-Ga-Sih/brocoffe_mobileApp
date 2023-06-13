import 'package:mysql1/mysql1.dart';

class DatabaseConnection {
  static final DatabaseConnection _instance = DatabaseConnection._internal();

  factory DatabaseConnection() => _instance;

  static late MySqlConnection _connection;

  DatabaseConnection._internal();

  Future<MySqlConnection> getConnection() async {
    if (_connection != null) {
      return _connection;
    }

    final settings = ConnectionSettings(
      host: 'localhost', // Ganti dengan host Anda
      port: 3306, // Ganti dengan port yang sesuai
      user: 'root', // Ganti dengan username database Anda
      password: 'limonade123', // Ganti dengan password database Anda
      db: 'brocoffee', // Ganti dengan nama database Anda
    );

    _connection = await MySqlConnection.connect(settings);
    return _connection;
  }
}
