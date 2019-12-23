import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:instagram_flutter/core/config.dart';
import 'package:instagram_flutter/core/dio_client.dart';
import 'package:instagram_flutter/features/story/models/story.dart';
import 'package:http/http.dart' as http;

class StoryService {
  static Future<List<Story>> getLatestStories() async {
    List<Story> stories;

    try {
      // dio
      // Response<List<dynamic>> response =
      //     await DioClient().dio.get("${Config.value.apiBaseUrl}/stories");
      // stories = response.data.map((story) {
      //   return Story.fromJson(story);
      // }).toList();

      // json
      var jsonString = await rootBundle.loadString('assets/data/db.json');
      var json = jsonDecode(jsonString);
      List<dynamic> jsonStories = json["stories"];
      stories = jsonStories.map((story) {
        return Story.fromJson(story);
      }).toList();

      // http
      // var response = await http.get("${Config.value.apiBaseUrl}/stories");
      // if (response.statusCode == 200) {
      //   List<dynamic> jsonResponse = jsonDecode(response.body);
      //   stories = jsonResponse.map((story) {
      //     return Story.fromJson(story);
      //   }).toList();
      // } else {
      //   print(
      //       "[StoryService][getLatestStories] - Failed to fetch - ${response.statusCode}");
      // }
    } catch (e) {
      print("[StoryService][getLatestStories] - Failed to fetch - $e");
    }

    return stories;
  }
}
