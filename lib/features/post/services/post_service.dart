import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:instagram_flutter/core/config.dart';
import 'package:instagram_flutter/core/dio_client.dart';
import 'package:instagram_flutter/features/post/models/post.dart';
import 'package:http/http.dart' as http;

class PostService {
  static Future<List<Post>> getLatestPosts() async {
    List<Post> posts;

    try {
      // Response<List<dynamic>> response =
      //     await DioClient().dio.get("${Config.value.apiBaseUrl}/posts");
      // posts = response.data.map((post) {
      //   return Post.fromJson(post);
      // }).toList();

      var jsonString = await rootBundle.loadString('assets/data/db.json');
      var json = jsonDecode(jsonString);
      List<dynamic> jsonPosts = json["posts"];
      posts = jsonPosts.map((post) {
        return Post.fromJson(post);
      }).toList();

      // http
      // var response =
      //     await http.get("${Config.value.apiBaseUrl}/stories", headers: {
      //   "Accept": "application/json",
      // });
      // if (response.statusCode == 200) {
      //   print('response.body ${response.body}');
      //   List<dynamic> jsonResponse = jsonDecode(response.body);
      //   posts = jsonResponse.map((dynamic post) {
      //     print('_post json $post');

      //     Post _post = Post.fromJson(post);
      //     print('_post ${_post.description}');
      //     return Post.fromJson(post);
      //   }).toList();
      // } else {
      //   print(
      //       "[PostService][getLatestPosts] - Failed to fetch - ${response.statusCode}");
      // }
    } catch (e) {
      print("[PostService][getLatestPosts] - Failed to fetch - $e");
    }

    return posts;
  }
}
