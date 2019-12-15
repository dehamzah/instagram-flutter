import 'package:instagram_flutter/features/account/models/user.dart';
import 'package:instagram_flutter/features/post/models/media.dart';
import 'package:json_annotation/json_annotation.dart';

part 'story.g.dart';

@JsonSerializable(explicitToJson: true)
class Story {
  final String id;
  final bool isRead;
  final User user;
  final List<Media> medias;

  Story({
    this.id,
    this.isRead,
    this.user,
    this.medias,
  });

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

  Map<String, dynamic> toJson() => _$StoryToJson(this);
}
