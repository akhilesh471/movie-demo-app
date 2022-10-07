import 'dart:developer';

import 'package:demo_app/model/character_model.dart';
import 'package:demo_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Character>> getData() async {
  List<Character> list = [];
  try {
    var response = await http.get(Uri.parse(ApiServices().apiUrl));
    if (response.statusCode == 200 || response.statusCode == 201) {
      list = charactersModelFromJson(response.body).characters;
    }
  } catch (e) {
    log(e.toString());
  }
  return list;
}
