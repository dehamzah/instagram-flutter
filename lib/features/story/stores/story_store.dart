import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter/features/story/models/story.dart';
import 'package:instagram_flutter/features/story/services/story_service.dart';

class StoryStore with ChangeNotifier {
  bool isLoading = false;
  List<Story> stories;

  void getLatestStories() async {
    this.isLoading = true;
    this.stories = await StoryService.getLatestStories();
    this.isLoading = false;
    notifyListeners();
  }
}
