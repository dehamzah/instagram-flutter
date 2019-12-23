import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter/features/post/models/post.dart';
import 'package:instagram_flutter/features/post/services/post_service.dart';

class PostStore with ChangeNotifier {
  bool isLoading = false;
  List<Post> posts;

  void getLatestPosts() async {
    this.isLoading = true;
    this.posts = await PostService.getLatestPosts();
    this.isLoading = false;
    notifyListeners();
  }
}
