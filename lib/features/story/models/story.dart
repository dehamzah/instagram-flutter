import 'package:instagram_flutter/features/account/models/user.dart';

class Story {
  final String id;
  final bool isRead;
  final User user;

  Story({this.id, this.isRead, this.user});
}
