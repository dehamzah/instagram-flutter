import 'package:instagram_flutter/features/account/models/user.dart';
import 'package:instagram_flutter/features/post/models/media.dart';
import 'package:json_annotation/json_annotation.dart';

part 'story.g.dart';

@JsonSerializable(explicitToJson: true)
class Story {
  final int id;
  final User user;
  final List<Media> medias;
  bool isRead;
  int currentViewedStoryIndex;

  Story({
    this.id,
    this.user,
    this.medias,
    this.isRead = false,
    this.currentViewedStoryIndex = 0,
  });

  setRead(bool val) {
    this.isRead = val;
  }

  setCurrentViewedStoryIndex(int index) {
    this.currentViewedStoryIndex = index;
  }

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

  Map<String, dynamic> toJson() => _$StoryToJson(this);
}
