import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper{

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "music3.db");
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
    sqlCreateMusic = "CREATE TABLE StudyMusics(id int PRIMARY KEY,name varchar(100),link varchar(200), imageLink varchar(200))";
    await db.execute(sqlCreateMusic);
    sqlCreateMusic = "create table DrawerGenres(id int PRIMARY KEY, genreName varchar(100), musicName varchar(60), musicSinger varchar(60), linkMusicWallpaper varchar(100), youtubeURL varchar(100))";
    await db.execute(sqlCreateMusic);
    await insertIntoTables(db);
  }

  Future<FutureOr<void>> insertIntoTables(Database db) async {
    String sqlMusic;
    String sqlGenre;
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (0,'Come and Go', 'https://youtu.be/SjGVvdq9ZCs', 'https://i0.wp.com/br.nacaodamusica.com/wp-content/uploads/2020/07/Juice-WRLD.jpg');";
    await db.execute(sqlMusic);
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (1,'Tipo Madara', 'https://youtu.be/wCMzj9Gzyt0?list=RDMM', 'https://images3.alphacoders.com/695/695428.jpg');";
    await db.execute(sqlMusic);
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (2,'After Party', 'https://youtu.be/GyR38LqBWEE?list=RDMM', 'https://i1.sndcdn.com/artworks-MUe0sOoezI9ORG2U-YTIzhA-t500x500.jpg');";
    await db.execute(sqlMusic);
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (3,'Feel Like God', 'https://youtu.be/Rxu-SeaLmlo?list=RDMM', 'https://i.ytimg.com/vi/kw-XWS1Usio/sddefault.jpg');";
    await db.execute(sqlMusic);
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (4,'Drunk and Nasty', 'https://youtu.be/3T5rSK0rd7k?list=RDMM', 'https://m.media-amazon.com/images/I/71iG4caogJL._SS500_.jpg');";
    await db.execute(sqlMusic);
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (5,'Vibe Zabuza', 'https://youtu.be/x6VWj8JeyIU?list=RDMM', 'https://besthqwallpapers.com/Uploads/6-12-2019/114238/thumb2-zabuza-momochi-4k-naruto-characters-momochi-zabuza-manga.jpg');";
    await db.execute(sqlMusic);
    sqlMusic = "insert into StudyMusics(id, name, link, imageLink) values (6,'Rick and Morty', 'https://youtu.be/br8qyUSbuDI', 'https://static.itapemafm.com.br/s3fs-public/styles/itapema_blog_post_header/public/graphql-upload-files/rick%20and%20morty%20temporada%205_1.jpg');";
    await db.execute(sqlMusic);

    sqlGenre = "insert into DrawerGenres(id, genreName, musicName, musicSinger, linkMusicWallpaper, youtubeURL) values (0, 'Lofi', 'Lofi Hip Hop', 'Instrumental', 'https://c4.wallpaperflare.com/wallpaper/908/34/383/lofi-digital-anthro-hd-wallpaper-preview.jpg', 'https://youtu.be/jfKfPfyJRdk')";
    await db.execute(sqlGenre);
    sqlGenre = "insert into DrawerGenres(id, genreName, musicName, musicSinger, linkMusicWallpaper, youtubeURL) values (1, 'Hip Hop', 'Yeat - Already Rich', 'Remix', 'https://images.alphacoders.com/998/thumb-1920-998446.jpg', 'https://youtu.be/jfKfPfyJRdk')";
    await db.execute(sqlGenre);
    sqlGenre = "insert into DrawerGenres(id, genreName, musicName, musicSinger, linkMusicWallpaper, youtubeURL) values (2, 'Pop', 'Cheerleader', 'Felix Jaehn', 'https://upload.wikimedia.org/wikipedia/commons/6/6e/JU_Cheerleaders.jpg', 'https://youtu.be/rXF9ziZ3AU4?list=RDGMEMQ1dJ7wXfLlqCjwV0xfSNbA')";
    await db.execute(sqlGenre);
    sqlGenre = "insert into DrawerGenres(id, genreName, musicName, musicSinger, linkMusicWallpaper, youtubeURL) values (3, 'Electronic', 'Electronic', 'Instrumental', 'https://c4.wallpaperflare.com/wallpaper/908/34/383/lofi-digital-anthro-hd-wallpaper-preview.jpg', 'https://youtu.be/jfKfPfyJRdk')";
    await db.execute(sqlGenre);
    sqlGenre = "insert into DrawerGenres(id, genreName, musicName, musicSinger, linkMusicWallpaper, youtubeURL) values (4, 'Hip Hop', 'Lucid Dreams', 'Juice WRLD', 'https://i.pinimg.com/736x/09/f8/f3/09f8f3fe8f6020afd034531d78a7637f.jpg', 'https://youtu.be/mzB1VGEGcSU?list=PLDUJWPwQe9iOVT5Y1WEL3E7kHOBTGiCvW')";
    await db.execute(sqlGenre);
    sqlGenre = "insert into DrawerGenres(id, genreName, musicName, musicSinger, linkMusicWallpaper, youtubeURL) values (5, 'Pop', 'I Really Like to Party', 'Remix', 'https://files.musicfeed.ir/photoes/1400/08/i-really-like-to-party.jpg', 'https://youtu.be/o6jZo5ub3hw?list=RDGMEMQ1dJ7wXfLlqCjwV0xfSNbA')";
    await db.execute(sqlGenre);
    sqlGenre = "insert into DrawerGenres(id, genreName, musicName, musicSinger, linkMusicWallpaper, youtubeURL) values (6, 'Electronic', 'Better Now', 'Post Malone', 'https://i1.sndcdn.com/artworks-000583785761-cnd2zw-t500x500.jpg', 'https://youtu.be/jfKfPfyJRdk')";
    await db.execute(sqlGenre);
  }

  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    if(oldVersion == 1 && newVersion == 2){
      onCreate(db, newVersion);
    }
  }
}
