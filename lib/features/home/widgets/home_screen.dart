import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/data/users.dart';
import 'package:instagram_flutter/core/icons/instagram_icons.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/features/story/containers/stories_section.dart';
import 'package:instagram_flutter/features/story/models/story.dart';

List<Story> stories = [
  Story(id: '1', isRead: false, user: tomioka),
  Story(id: '2', isRead: false, user: nezuko),
  Story(id: '3', isRead: false, user: zenitsu),
  Story(id: '4', isRead: false, user: tanjiro),
  Story(id: '5', isRead: false, user: tomioka),
  Story(id: '6', isRead: false, user: nezuko),
  Story(id: '7', isRead: false, user: zenitsu),
  Story(id: '8', isRead: false, user: tanjiro),
  Story(id: '9', isRead: false, user: tanjiro),
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            top: Dimens.space8,
            bottom: Dimens.space8,
          ),
          child: Image.asset(
            'assets/images/instagram.png',
          ),
        ),
        leading: Icon(InstagramIcons.photo_outline),
        trailing: Icon(InstagramIcons.inbox_outlined),
      ),
      child: Container(
        child: ListView(
          padding: EdgeInsets.only(
            top: 80,
          ),
          children: <Widget>[
            StoriesSection(
              stories: stories,
            ),
          ],
        ),
      ),
    );
  }
}
