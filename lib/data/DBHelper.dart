import 'dart:async';
import 'package:music/data/music_contents.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper{

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "music.db");

    Database database = await openDatabase(
        path,
        version: 1,
        onCreate: onCreate,

    );
    return database;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sqlMusic;

    sqlMusic = "create table StudyMusics(id INTERGER PRIMARY KEY, name varchar(40), link varchar(200), imageLink(320));";
    await db.execute(sqlMusic);
    insertIntoMusicTable(db);
  }

  Future<FutureOr<void>> insertIntoMusicTable(Database db) async {
    List list = MusicDatabase.musicObjects;
    String sqlMusic;
    int count = 0;

    for (var music in list) {
      sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values ('$count', '${music.name}', '${music.link}', '${music.imageLink}')";
      await db.execute(sqlMusic);
      count++;
    }

  }

}