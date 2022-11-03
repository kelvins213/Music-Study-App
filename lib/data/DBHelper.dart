import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper{

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "music.db");
    Database database = await openDatabase(
      path,
      version: 2,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );
    print(path);
    return database;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sqlCreateMusic;
    sqlCreateMusic = "CREATE TABLE StudyMusics(id int PRIMARY KEY,name varchar(100),link varchar(200),imageLink(200))";
    await db.execute(sqlCreateMusic);
    await insertIntoMusicTable(db);
  }

  Future<FutureOr<void>> insertIntoMusicTable(Database db) async {
    String sqlMusic;

    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (0,'Tipo Madara', 'https://youtu.be/wCMzj9Gzyt0?list=RDMM', 'https://images3.alphacoders.com/695/695428.jpg');";
    await db.execute(sqlMusic);
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (1,'After Party', 'https://youtu.be/GyR38LqBWEE?list=RDMM', 'https://i1.sndcdn.com/artworks-MUe0sOoezI9ORG2U-YTIzhA-t500x500.jpg');";
    await db.execute(sqlMusic);
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (2,'Feel Like God', 'https://youtu.be/Rxu-SeaLmlo?list=RDMM', 'https://i.ytimg.com/vi/kw-XWS1Usio/sddefault.jpg');";
    await db.execute(sqlMusic);
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (3,'Drunk and Nasty', 'https://youtu.be/3T5rSK0rd7k?list=RDMM', 'https://m.media-amazon.com/images/I/71iG4caogJL._SS500_.jpg');";
    await db.execute(sqlMusic);
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (4,'Vibe Zabuza', 'https://youtu.be/x6VWj8JeyIU?list=RDMM', 'https://besthqwallpapers.com/Uploads/6-12-2019/114238/thumb2-zabuza-momochi-4k-naruto-characters-momochi-zabuza-manga.jpg');";
    await db.execute(sqlMusic);
  }

  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    if(oldVersion == 1 && newVersion == 2){
      onCreate(db, newVersion);
    }
  }
}