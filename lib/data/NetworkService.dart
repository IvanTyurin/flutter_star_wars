import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'Character.dart';

class NetworkService {

  void Function(List<Character>) callback;
  static final NetworkService instance = NetworkService();

  String url = "https://swapi.dev/api/people/";
  List<Character> charactersList;

  void connect() async {
    var responce = await http.get(url);

    if(responce.statusCode == 200) {
      print(responce.body);
    }
  }

  List<Character> convert() {

  }
}