import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Character.dart';

class NetworkService {

  void Function(List<Character>) callback;

  String url = "https://swapi.dev/api/people/";
  List<Character> charactersList = [];
  bool inSearch = false;
  String buf;

  void sendRequest([String searchRequest]) async {
    String requestUrl;

    if(searchRequest != null) {
      if(searchRequest.contains("http", 0)) {
        requestUrl = searchRequest;
      }
    } else {
      charactersList = [];
      requestUrl = url;
    }

    await http.get(requestUrl).then((value) {
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

  void search(String searchString) {
    List<Character> result = [];
    String searchStr = searchString.toLowerCase();
    charactersList.forEach((element) {
      String name = element.name.toLowerCase();
      if(name.contains(searchStr)) result.add(element);
    });
    if(result != null) {
      callback(result);
    }
  }

  List<Character> convertJsonData(String rowData) {

    Map<String, dynamic> firstDecode = jsonDecode(rowData);

    if(firstDecode.containsKey("count")) {
      List<dynamic> results = firstDecode["results"];
      results.forEach((element) {
        Character buf = Character.fromJson(element);
        charactersList.add(buf);
      });
    }
    if(firstDecode["next"] != null) {
      sendRequest(firstDecode["next"].toString());
    } else {
      if(charactersList != null) {
        callback(charactersList);
      }
    }
  }
}