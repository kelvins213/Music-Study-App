import 'package:sqflite/sqflite.dart';

class DataRequest{

  getData({
    required int id,
    required Database db,
    dynamic json,
  }) async {
    String sqlSearch = "SELECT * FROM StudyMusics WHERE id = ?";
    json = await db.rawQuery(sqlSearch, [id]);
    return json;
  }
}