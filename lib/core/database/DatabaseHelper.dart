import 'dart:io';
import 'package:hepsiyoldaapp/features/home/model/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static  DatabaseHelper? _databaseHelper; // Singleton DatabaseHelper
  static  Database? _database; // Singleton Database

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'sportgen2.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,sId Text,'
          'name TEXT,image Text,total INTEGER,price INTEGER)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.

      version: 1,
    );

    return database;
  }

  // void _createDb(Database db, int newVersion) async {
  //
  //   await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
  //       '$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
  // }
  // Fetch Operation: Get all note objects from database

  Future<void> insertProduct(Product product) async {
    print("selaaaam"+product.sId);
    final db = await database;
    await db.insert(
      'products',
      product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Product>> getProducts() async {
    // Get a reference to the database.
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');

    return List.generate(maps.length, (i) {
      return Product(
        sId: maps[i]['sId'],
        name: maps[i]['name'],
        image: maps[i]['image'],
        total: maps[i]['total'],
        price: maps[i]['price'],
      );
    });
  }

  Future<void> deleteDatabase() async {

    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "products.db");





}

}


