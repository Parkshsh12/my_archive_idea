import 'package:my_archive_idea/data/idea_info.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  late Database database;

  Future<void> initDatabase() async {
    // 데이터베이스 경로 가져오기
    String path = join(await getDatabasesPath(), 'archive_idea.db');

    // 데이터베이스 열기 또는 생성
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        // 데이터베이스가 생성될때 실행되는 코드
        db.execute('''
        CREATE TABLE IF NOT EXISTS tb_idea (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          motive TEXT,
          content TEXT,
          priority INTEGER,
          feedback TEXT,
          createAt INTEGER
        )
      ''');
      },
    );
  }

  // IdeaInfo 데이터 삽입(insert)
  Future<int> insertIdeaInfo(IdeaInfo idea) async {
    return await database.insert('tb_idea', idea.toMap());
  }

  // IdeaInfo 데이터 조회(select)
  Future<List<IdeaInfo>> getAllIdeaInfo() async {
    final List<Map<String, dynamic>> result = await database.query('tb_idea');
    return List.generate(
      result.length,
      (index) {
        return IdeaInfo.fromMap(result[index]);
      },
    );
  }

  // IdeaInfo 데이터 수정(update)
  Future<int> updateIdeaInfo(IdeaInfo idea) async {
    return database.update(
      'tb_idea',
      idea.toMap(),
      where: 'id = ?',
      whereArgs: [idea.id],
    );
  }
// IdeaInfo 데이터 삭제(delete)
  Future<int> deleteIdeaInfo(int id) async {
    return database.delete(
      'tb_idea',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  // 데이터베이스 닫기(앱 내에서 데이터베이스 사용을 하지 않을 경우 닫아줘야함)
  Future<void> closeDatabase() async {
    await database.close();
  }
}
