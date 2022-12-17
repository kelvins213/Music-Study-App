import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:music/domain/playlist.dart';

class PlaylistAPI {

  final String baseURL = "musicappapi.fhyvugvfjudgf.repl.co";

  Future<List<Playlist>> listDatas() async {

    Uri url = Uri.http(baseURL, "/resgatarJSON");
    Response response = await http.get(url);
    List <dynamic> jsonList = <dynamic>[];
    List <Playlist> playlistContents = <Playlist> [];

    print(response.statusCode);
    print(response.body);


    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      for (var json in result) {
        jsonList.add(json);
      }
      for (var json in jsonList) {
        Playlist play = Playlist.fromJson(json);
        playlistContents.add(play);
      }
    }
    //essa variável jsonList tem os JSONs retornados pela API em javascript
    return playlistContents;
  }
}





