import 'package:dio/dio.dart';
import 'package:instagram_flutter/core/dio_client.dart';
import 'package:instagram_flutter/features/story/models/story.dart';

class StoryService {
  static Future<List<Story>> getLatestStories() async {
    List<Story> stories;

    try {
      Response<List<dynamic>> response = await DioClient().dio.get("/stories");
      stories = response.data.map((story) {
        return Story.fromJson(story);
      }).toList();
    } catch (e) {
      print("[StoryService][getLatestStories] - Failed to fetch - $e");
    }

    return stories;
  }
}
