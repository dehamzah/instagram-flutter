import 'package:instagram_flutter/features/account/models/user.dart';

class Post {
  final User user;
  final List<String> mediaUrls;
  final String mediaType;
  final String location;
  final String description;
  final bool isLoved;
  final bool isSaved;
  final String createdAt;
  final String updatedAt;

  Post({
    this.user,
    this.mediaUrls,
    this.mediaType,
    this.location,
    this.description,
    this.isLoved,
    this.isSaved,
    this.createdAt,
    this.updatedAt,
  });
}
