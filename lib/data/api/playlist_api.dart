import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:music/domain/playlist.dart';

class PlaylistAPI {

  final String baseURL = "musicappapi.fhyvugvfjudgf.repl.co";
  //List <Playlist> playlistContents = <Playlist> [];

  Future<List<Playlist>> listDatas() async {
    Uri url = Uri.http(baseURL, "/resgatarMusicas");
    Response response = await http.get(url);
    List <Playlist> playlistContents = <Playlist> [];

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print("$result \n");

      for (var json in result) {
        Playlist play = Playlist.fromJson(json);
        playlistContents.add(play);
      }
      print("$playlistContents \n");
    }

    return playlistContents;
  }

  Future<void> insertMusicDatas({required String musicName, required String url, required String thumbnail}) async {

    Uri uri = Uri.http(baseURL, "/cadastrarMusica/$musicName/$url/$thumbnail");
    Response response = await http.get(uri);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {

    }
  }

  Future<void> deleteMusicRow({required String musicName}) async {
    Uri url = Uri.http(baseURL, "/deletarMusica/$musicName/");
    Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {

    }

  }


}

/*
//Cach
//https://youtu.be/loa_IxjUBKo?list=RDMMYRhX73YD0Uo
//https://thumbs.dreamstime.com/b/muito-dinheiro-2153680.jpg
*/



