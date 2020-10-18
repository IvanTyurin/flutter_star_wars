import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'Character.dart';

class NetworkService {

  void Function(List<Character>) callback;

  String url = "https://swapi.dev/api/people/";
  List<Character> charactersList;
  String buf;

  void sendRequest() async {
    await http.get(url).then((value) {
      if(value.statusCode == 200) {
        print(value.body);
        buf = value.body;
      }
    }).whenComplete(() {
      if(buf != null) {
        convertJsonData(buf);
      }
    });
  }

  List<Character> convertJsonData(String rowData) {
    List<Character> charactersList;
    Map<String, dynamic> firstDecode = jsonDecode(rowData);

    if(firstDecode.containsKey("count")) {
      print(firstDecode["results"].runtimeType);
      List<dynamic> results = firstDecode["results"];
      results.forEach((element) {
        Character buf = Character.fromJson(element);
        if(charactersList == null) charactersList = [buf];
        else charactersList.add(buf);
      });
    }

    if(charactersList != null) {
      callback(charactersList);
    }
  }
}