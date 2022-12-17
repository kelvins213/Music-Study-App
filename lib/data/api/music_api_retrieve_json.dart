import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MusicApi {

  final String baseURL = "musicappapi.fhyvugvfjudgf.repl.co";

  Future<List> listDatas() async {

    Uri url = Uri.http(baseURL, "/resgatarJSON");
    Response response = await http.get(url);
    List <dynamic> jsonList = <dynamic>[];

    print(response.statusCode);
    print(response.body);


    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      for (var json in result) {
        jsonList.add(json);
      }
    }
    //essa variável jsonList tem os JSONs retornados pela API em javascript
    return jsonList;
  }
}





