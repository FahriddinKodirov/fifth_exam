import 'package:exam_five/data/model/user/user_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  Database? database;
  String tableName = "products";

  Future<Database> getDb() async {
    if (database == null) {
      database = await createDatabase();
      return database!;
    }
    return database!;
  }

  createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = '${databasesPath}products.db';

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE $tableName ("
        "${ProductFields.newTitle} INTEGER,"
        "${ProductFields.description} INTEGER,"
        "${ProductFields.newImage} TEXT,"
        "${ProductFields.datetime} INTEGER,"
        ")");
  }

  Future addProduct(UserModel userModel) async {
    Database db = await getDb();
    await db.insert(tableName, userModel.toJson());
  }

  Future<List> getAllProduct() async {
    Database db = await getDb();

    var result = await db.query(tableName, columns: [
      ProductFields.newTitle,
      ProductFields.description,
      ProductFields.newImage,
      ProductFields.datetime,
    ]);



    return result.toList();
  }

  Future<int> deleteAllData() async {
    Database db = await getDb();
    return await db.delete(tableName);
  }
}