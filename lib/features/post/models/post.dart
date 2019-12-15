import 'package:instagram_flutter/features/account/models/user.dart';
import 'package:instagram_flutter/features/post/models/media.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable(explicitToJson: true)
class Post {
  final User user;
  final List<Media> medias;
  final String location;
  final String description;
  final bool isLoved;
  final bool isSaved;
  final String createdAt;
  final String updatedAt;

  Post({
    this.user,
    this.medias,
    this.location,
    this.description,
    this.isLoved,
    this.isSaved,
    this.createdAt,
    this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
