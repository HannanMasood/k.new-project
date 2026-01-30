// import 'dart:async';
// import 'package:myapp/Model.dart'; 
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DBHelper {
//   static final DBHelper _instance = DBHelper._internal();
//   factory DBHelper() => _instance;
//   DBHelper._internal();

//   static Database? _database;

//   // Database getter
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB();
//     return _database!;
//   }

//   // Initialize DB
//   Future<Database> _initDB() async {
//     String path = join(await getDatabasesPath(), 'company.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }

//  Future _onCreate(Database db, int version) async {
//   await db.execute('''
//     CREATE TABLE companies (
//       id INTEGER PRIMARY KEY AUTOINCREMENT,
//       name TEXT NOT NULL,
//       title TEXT NOT NULL,
//       description TEXT
//     )
//   ''');
// }

//   // Insert a company
//   Future<int> insertCompany(company c) async {
//     final db = await database;
//     return await db.insert('companies', c.json());
//   }

//   // Get all companies
//   Future<List<company>> getCompanies() async {
//     final db = await database;
//     final result = await db.query('companies');
//     return result.map((map) => company.fromMap(map)).toList();
//   }

//   // Update a company
//   Future<int> updateCompany(company c) async {
//     final db = await database;
//     return await db.update(
//       'companies',
//       c.json(),
//       where: 'id = ?',
//       whereArgs: [c.id],
//     );
//   }

//   // Delete a company
//   Future<int> deleteCompany(int id) async {
//     final db = await database;
//     return await db.delete(
//       'companies',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
// }




// import 'dart:async';
// import 'package:myapp/Model.dart'; 
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DBHelper {
//   static final DBHelper _instance = DBHelper._internal();
//   factory DBHelper() => _instance;
//   DBHelper._internal();

//   static Database? _database;

//   // Database getter
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB();
//     return _database!;
//   }

//   // Initialize DB
//   Future<Database> _initDB() async {
//     String path = join(await getDatabasesPath(), 'company.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }

//   // Create table - FIXED to match your model
//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE companies (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         name TEXT NOT NULL,
//         title TEXT NOT NULL,
//         description TEXT
//       )
//     ''');
//   }

//   // Insert a company
//   Future<int> insertCompany(company c) async {
//     try {
//       final db = await database;
//       return await db.insert('companies', c.json());
//     } catch (e) {
//       print('Error inserting company: $e');
//       return -1;
//     }
//   }

//   // Get all companies
//   Future<List<company>> getCompanies() async {
//     try {
//       final db = await database;
//       final result = await db.query('companies');
//       return result.map((map) => company.fromMap(map)).toList();
//     } catch (e) {
//       print('Error getting companies: $e');
//       return [];
//     }
//   }

//   // Get company by ID
//   Future<company?> getCompanyById(int id) async {
//     try {
//       final db = await database;
//       final result = await db.query(
//         'companies',
//         where: 'id = ?',
//         whereArgs: [id],
//       );
//       if (result.isNotEmpty) {
//         return company.fromMap(result.first);
//       }
//       return null;
//     } catch (e) {
//       print('Error getting company: $e');
//       return null;
//     }
//   }

//   // Update a company
//   Future<int> updateCompany(company c) async {
//     try {
//       final db = await database;
//       return await db.update(
//         'companies',
//         c.json(),
//         where: 'id = ?',
//         whereArgs: [c.id],
//       );
//     } catch (e) {
//       print('Error updating company: $e');
//       return 0;
//     }
//   }

//   // Delete a company
//   Future<int> deleteCompany(int id) async {
//     try {
//       final db = await database;
//       return await db.delete(
//         'companies',
//         where: 'id = ?',
//         whereArgs: [id],
//       );
//     } catch (e) {
//       print('Error deleting company: $e');
//       return 0;
//     }
//   }

//   // Search companies by name or title
//   Future<List<company>> searchCompanies(String query) async {
//     try {
//       final db = await database;
//       final result = await db.query(
//         'companies',
//         where: 'name LIKE ? OR title LIKE ?',
//         whereArgs: ['%$query%', '%$query%'],
//       );
//       return result.map((map) => company.fromMap(map)).toList();
//     } catch (e) {
//       print('Error searching companies: $e');
//       return [];
//     }
//   }

//   // Delete all companies
//   Future<int> deleteAllCompanies() async {
//     try {
//       final db = await database;
//       return await db.delete('companies');
//     } catch (e) {
//       print('Error deleting all companies: $e');
//       return 0;
//     }
//   }

//   // Get total count
//   Future<int> getCompaniesCount() async {
//     try {
//       final db = await database;
//       var result = await db.rawQuery('SELECT COUNT(*) FROM companies');
//       int? count = Sqflite.firstIntValue(result);
//       return count ?? 0;
//     } catch (e) {
//       print('Error getting count: $e');
//       return 0;
//     }
//   }
// }


// import 'package:myapp/Model.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';


// class DBHelper {
//   static final DBHelper _instance = DBHelper._internal();
//   factory DBHelper() => _instance;
//   DBHelper._internal();

//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB();
//     return _database!;
//   }

//   Future<Database> _initDB() async {
//     String path = join(await getDatabasesPath(), 'notes.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE notes (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         title TEXT NOT NULL,
//         content TEXT,
//         date TEXT
//       )
//     ''');
//   }

//   Future<int> insertNote(company note) async {
//     final db = await database;
//     return await db.insert('notes', note.json());
//   }

//   Future<List<company>> getNotes() async {
//     final db = await database;
//     final result = await db.query('notes', orderBy: 'id DESC');
//     return result.map((e) => company.fromMap(e)).toList();
//   }

//   Future<int> updateNote(company note) async {
//     final db = await database;
//     return await db.update(
//       'notes',
//       note.json(),
//       where: 'id = ?',
//       whereArgs: [note.id],
//     );
//   }

//   Future<int> deleteNote(int id) async {
//     final db = await database;
//     return await db.delete(
//       'notes',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
// }

// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:myapp/Model.dart';

// class DBHelper {
//   static final DBHelper _instance = DBHelper._internal();
//   factory DBHelper() => _instance;
//   DBHelper._internal();

//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB();
//     return _database!;
//   }
// Future<Database> _initDB() async {
//   String path = join(await getDatabasesPath(), 'myapp_v2.db');
//   return await openDatabase(
//     path,
//     version: 2, // ⬅️ increment this
//     onCreate: _onCreate,
//     onUpgrade: (db, oldVersion, newVersion) async {
//       await db.execute('DROP TABLE IF EXISTS users');
//       await db.execute('DROP TABLE IF EXISTS notes');
//       await _onCreate(db, newVersion);
//     },
//   );
// }


//   Future<void> _onCreate(Database db, int version) async {
//     // USERS TABLE
//     await db.execute('''
//       CREATE TABLE users (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         username TEXT UNIQUE,
//         password TEXT
//       )
//     ''');

//     // NOTES TABLE (ONLY ONCE)
//     await db.execute('''
//       CREATE TABLE notes (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         title TEXT NOT NULL,
//         content TEXT
//       )
//     ''');
//   }

//   // ================= NOTES =================

//   Future<int> insertNote(Company note) async {
//     final db = await database;
//     return await db.insert(
//       'notes',
//       note.json(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<Company>> getNotes() async {
//     final db = await database;
//     final maps = await db.query('notes', orderBy: 'id DESC');
//     return maps.map((e) => Company.fromMap(e)).toList();
//   }

//   Future<int> updateNote(Company note) async {
//     final db = await database;
//     return await db.update(
//       'notes',
//       note.json(),
//       where: 'id = ?',
//       whereArgs: [note.id],
//     );
//   }

//   Future<int> deleteNote(int id) async {
//     final db = await database;
//     return await db.delete(
//       'notes',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }

//   // ================= USERS =================

//   Future<int> insertUser(String username, String password) async {
//     final db = await database;
//     return await db.insert('users', {
//       'username': username,
//       'password': password,
//     });
//   }

//   Future<Map<String, dynamic>?> loginUser(
//       String username, String password) async {
//     final db = await database;
//     final res = await db.query(
//       'users',
//       where: 'username = ? AND password = ?',
//       whereArgs: [username, password],
//     );
//     return res.isNotEmpty ? res.first : null;
//   }
//   Future<int> getNotesCount() async {
//   final db = await database;
//   final result = await db.rawQuery('SELECT COUNT(*) FROM notes');
//   return Sqflite.firstIntValue(result) ?? 0;
// }

// }







// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'model.dart';

// class DatabaseHelper {
//   static Database? _db;

//   static Future<Database> getDatabase() async {
//     if (_db != null) return _db!;

//     final path = join(await getDatabasesPath(), 'todo.db');

//     _db = await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE todo(
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             title TEXT,
//             content TEXT
//           )
//         ''');
//       },
//     );

//     return _db!;
//   }

//   // INSERT
//   static Future<void> insertNote(Company todo) async {
//     final db = await getDatabase();
//     await db.insert('todo', todo.json());
//     print('added');
//   }

//   // UPDATE
//   static Future<void> updateNote(Company todo) async {
//     final db = await getDatabase();
//     await db.update(
//       'todo',
//       todo.json(),
//       where: 'id = ?',
//       whereArgs: [todo.id],
//     );
//     print('updated');
//   }

//   // READ
//   static Future<List<Company>> getNote() async {
//     final db = await getDatabase();
//     final List<Map<String, dynamic>> data = await db.query('todo');

//     return data.map((e) => Company.fromMap(e)).toList();
//   }

//   // DELETE
//   static Future<void> deleteNotes(int id) async {
//     final db = await getDatabase();
//     await db.delete('todo', where: 'id = ?', whereArgs: [id]);
//     print('deleted');
//   }
// }














import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'Model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'company.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE company(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT
      )
    ''');
  }

  // Insert note
  Future<int> insertNote(Company note) async {
    final db = await database;
    return await db.insert('company', note.toMap());
  }

  // Get all notes
  Future<List<Company>> getNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('company', orderBy: 'id DESC');
    return List.generate(maps.length, (i) => Company.fromMap(maps[i]));
  }

  // Update note
  Future<int> updateNote(Company note) async {
    final db = await database;
    return await db.update(
      'company',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // Delete note
  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete(
      'company',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
