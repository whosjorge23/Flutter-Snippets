import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:learn_english_flutter/model/word.dart';

class WordViewModel {
  List<Word> words = [];
  // List<Word> get words => _words;

  Future<List<Word>> loadWords(String endpoint) async {
    final response =
    await http.get(Uri.parse('http://${endpoint}:8080/words'));
    final List<dynamic> data = json.decode(response.body);
    words = data.map((e) => Word.fromJson(e)).toList();
    // print(words);
    return words;
  }
}
