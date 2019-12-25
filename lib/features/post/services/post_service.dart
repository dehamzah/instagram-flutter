import 'package:dio/dio.dart';
import 'package:instagram_flutter/core/dio_client.dart';
import 'package:instagram_flutter/features/post/models/post.dart';

class PostService {
  static Future<List<Post>> getLatestPosts() async {
    List<Post> posts;

    try {
      Response<List<dynamic>> response = await DioClient().dio.get("/posts");
      posts = response.data.map((post) {
        return Post.fromJson(post);
      }).toList();
    } catch (e) {
      print("[PostService][getLatestPosts] - Failed to fetch - $e");
    }

    return posts;
  }
}
