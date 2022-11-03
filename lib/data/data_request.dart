import 'package:music/data/DBHelper.dart';
import 'package:music/domain/music.dart';
import 'package:sqflite/sqflite.dart';

class DataRequest{

  Future<List<Music>> buildDatabase() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = "SELECT * FROM StudyMusics;";
    final queryResult = await db.rawQuery(sql);
    print("Query Result: $queryResult");
    List<Music> musicList = <Music>[];

    for (var json in queryResult) {
      Music music = Music.fromJson(json);
      musicList.add(music);
    }

    return musicList;
  }
}