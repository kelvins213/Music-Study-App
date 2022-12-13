import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MusicApi {

  String baseURL = "https://studyappapi.fhyvugvfjudgf.repl.co/";

  Future<List> listDatas() async {

    Uri url = Uri.http(baseURL, "/resgatarJSON");
    Response response = await http.get(url);
    List <dynamic> jsonList = <dynamic>[];

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);

      for (var json in result) {
        jsonList.add(json);
      }
    }
    return jsonList;
  }
}





