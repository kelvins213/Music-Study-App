import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:music/data/api/music_api_retrieve_json.dart';
import 'package:music/data/bd/DBHelper.dart';
import 'package:sqflite/sqflite.dart';

class MusicsDatasApi {

  final String sql = "select * from StudyMusics";
  final String _baseUrl = "https://studyappapi.fhyvugvfjudgf.repl.co/";

  Future <void> buildDatabase() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    final queryResult = await db.rawQuery(sql);
    print("Query Result: $queryResult");
    insertMusicDatas(jsonList: queryResult);
  }


  Future<void> insertMusicDatas({required dynamic jsonList}) async {
    Uri url = Uri.http(_baseUrl, "/cadastrarJSON");
    //Response response = await http.post(url);
    Response response = await http.post(url, jsonList);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      MusicApi().listDatas();
    }

  }

}