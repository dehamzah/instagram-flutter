import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter/features/story/models/story.dart';
import 'package:instagram_flutter/features/story/services/story_service.dart';

class StoryStore with ChangeNotifier {
  bool isLoading = false;
  List<Story> stories;
  Story currentViewedStory;

  PageController storiesScreenPageController;

  Future<void> getLatestStories() async {
    this.isLoading = true;
    this.stories = await StoryService.getLatestStories();
    this.isLoading = false;
    notifyListeners();
  }

  void setStoryReaded(Story story) {
    List<Story> newStories = List.from(this.stories);
    int storyIndex = newStories.indexOf(story);
    newStories.removeAt(storyIndex);

    Story updatedStory = Story(
      id: story.id,
      user: story.user,
      medias: story.medias,
      isRead: true,
      currentViewedStoryIndex: story.currentViewedStoryIndex,
    );
    newStories.insert(storyIndex, updatedStory);
    this.stories = newStories;
    notifyListeners();
  }

  void setCurrentViewedStory(Story story) {
    this.currentViewedStory = story;
    notifyListeners();
  }

  void clearCurrentViewedStory() {
    this.currentViewedStory = null;
    notifyListeners();
  }

  void setCurrentViewedStoryIndex(int index, Story story) {
    List<Story> newStories = List.from(this.stories);
    int storyIndex = newStories.indexOf(story);
    newStories.removeAt(storyIndex);

    Story updatedStory = Story(
      id: story.id,
      user: story.user,
      medias: story.medias,
      isRead: story.isRead,
      currentViewedStoryIndex: index,
    );
    newStories.insert(storyIndex, updatedStory);
    this.stories = newStories;

    this.setCurrentViewedStory(updatedStory);
    notifyListeners();
  }

  void setStoriesScreenPageController(PageController pageController) {
    this.storiesScreenPageController = pageController;
  }
}
