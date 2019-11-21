import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/data/users.dart';
import 'package:instagram_flutter/core/icons/instagram_icons.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/features/post/containers/post_feed.dart';
import 'package:instagram_flutter/features/post/models/post.dart';
import 'package:instagram_flutter/features/post/widgets/post_card.dart';
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

List<Post> posts = [
  Post(
      user: tomioka,
      createdAt: '2019-08-02',
      updatedAt: '2019-09-02',
      description: 'Ulalala lala',
      isLoved: false,
      isSaved: false,
      mediaType: 'image',
      mediaUrls: [
        'https://www.pandotrip.com/wp-content/uploads/2018/09/Seigantoji-Pagoda-and-Nachi-Falls-in-Nacho-Japan.jpg',
        'https://d3hg7snzn13jf0.cloudfront.net/files/allabout/197/197--6aa89d928da447d4a85ee0947140e366.jpg'
      ]),
  Post(
      user: tomioka,
      createdAt: '2019-08-02',
      updatedAt: '2019-09-02',
      description: 'Ulalala lala',
      isLoved: false,
      isSaved: false,
      mediaType: 'image',
      mediaUrls: [
        'https://www.pandotrip.com/wp-content/uploads/2018/09/Seigantoji-Pagoda-and-Nachi-Falls-in-Nacho-Japan.jpg',
        'https://d3hg7snzn13jf0.cloudfront.net/files/allabout/197/197--6aa89d928da447d4a85ee0947140e366.jpg'
      ]),
  Post(
      user: tomioka,
      createdAt: '2019-08-02',
      updatedAt: '2019-09-02',
      description: 'Ulalala lala',
      isLoved: false,
      isSaved: false,
      mediaType: 'image',
      mediaUrls: [
        'https://www.pandotrip.com/wp-content/uploads/2018/09/Seigantoji-Pagoda-and-Nachi-Falls-in-Nacho-Japan.jpg',
        'https://d3hg7snzn13jf0.cloudfront.net/files/allabout/197/197--6aa89d928da447d4a85ee0947140e366.jpg'
      ]),
  Post(
      user: tomioka,
      createdAt: '2019-08-02',
      updatedAt: '2019-09-02',
      description: 'Ulalala lala',
      isLoved: false,
      isSaved: false,
      mediaType: 'image',
      mediaUrls: [
        'https://www.pandotrip.com/wp-content/uploads/2018/09/Seigantoji-Pagoda-and-Nachi-Falls-in-Nacho-Japan.jpg',
        'https://d3hg7snzn13jf0.cloudfront.net/files/allabout/197/197--6aa89d928da447d4a85ee0947140e366.jpg'
      ]),
  Post(
      user: tomioka,
      createdAt: '2019-08-02',
      updatedAt: '2019-09-02',
      description: 'Ulalala lala',
      isLoved: false,
      isSaved: false,
      mediaType: 'image',
      mediaUrls: [
        'https://www.pandotrip.com/wp-content/uploads/2018/09/Seigantoji-Pagoda-and-Nachi-Falls-in-Nacho-Japan.jpg',
        'https://d3hg7snzn13jf0.cloudfront.net/files/allabout/197/197--6aa89d928da447d4a85ee0947140e366.jpg'
      ]),
  Post(
      user: tomioka,
      createdAt: '2019-08-02',
      updatedAt: '2019-09-02',
      description: 'Ulalala lala',
      isLoved: false,
      isSaved: false,
      mediaType: 'image',
      mediaUrls: [
        'https://www.pandotrip.com/wp-content/uploads/2018/09/Seigantoji-Pagoda-and-Nachi-Falls-in-Nacho-Japan.jpg',
        'https://d3hg7snzn13jf0.cloudfront.net/files/allabout/197/197--6aa89d928da447d4a85ee0947140e366.jpg'
      ]),
  Post(
      user: tomioka,
      createdAt: '2019-08-02',
      updatedAt: '2019-09-02',
      description: 'Ulalala lala',
      isLoved: false,
      isSaved: false,
      mediaType: 'image',
      mediaUrls: [
        'https://www.pandotrip.com/wp-content/uploads/2018/09/Seigantoji-Pagoda-and-Nachi-Falls-in-Nacho-Japan.jpg',
        'https://d3hg7snzn13jf0.cloudfront.net/files/allabout/197/197--6aa89d928da447d4a85ee0947140e366.jpg'
      ]),
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
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            StoriesSection(
              stories: stories,
            ),
            PostFeed(
              posts: posts,
            )
          ],
        ),
      ),
    );
  }
}
