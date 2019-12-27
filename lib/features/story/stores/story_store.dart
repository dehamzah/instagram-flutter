import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter/features/story/models/story.dart';
import 'package:instagram_flutter/features/story/services/story_service.dart';

class StoryStore with ChangeNotifier {
  bool isLoading = false;
  List<Story> stories;
  int currentViewedStoryIndex = 0;
  List<int> viewedStoryIndexes = List<int>();

  Future<void> getLatestStories() async {
    this.isLoading = true;
    this.stories = await StoryService.getLatestStories();
    this.isLoading = false;
    notifyListeners();
  }

  void setCurrentViewedStoryIndex(int index) {
    this.currentViewedStoryIndex = index;
    notifyListeners();
  }

  void addViewedStoryIndex(int index) {
    List<int> updatedViewedStoryIndexes = List.from(this.viewedStoryIndexes)
      ..add(index);
    this.viewedStoryIndexes = updatedViewedStoryIndexes;
    notifyListeners();
  }

  void resetViewedStoryIndexes() {
    print('resetViewedStoryIndexes');
    this.viewedStoryIndexes = List<int>();
    notifyListeners();
  }
}
