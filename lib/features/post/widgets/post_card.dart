import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/icons/instagram_icons.dart';
import 'package:instagram_flutter/core/theme/colors.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/features/post/models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimens.space32),
      child: Column(
        children: <Widget>[
          PostCardHeader(
            avatarUrl: post.user.avatarUrl,
            title: post.user.username,
            subtitle: post.location,
          ),
          PostCardBody(
            mediaType: post.mediaType,
            mediaUrls: post.mediaUrls,
          ),
          PostCardActions()
        ],
      ),
    );
  }
}

class PostCardHeader extends StatelessWidget {
  final String avatarUrl;
  final String title;
  final String subtitle;

  const PostCardHeader({Key key, this.avatarUrl, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.space8),
      child: Row(
        children: <Widget>[
          Container(
            height: 30,
            width: 30,
            margin: EdgeInsets.only(right: Dimens.space8),
            child: CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle != null
                    ? Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          Icon(
            Icons.more_vert,
            color: ThemeColors.black2,
          )
        ],
      ),
    );
  }
}

class PostCardBody extends StatelessWidget {
  final List<String> mediaUrls;
  final String mediaType;

  const PostCardBody({Key key, this.mediaUrls, this.mediaType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Image(
            width: double.infinity,
            height: 300,
            image: NetworkImage(mediaUrls[index]),
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}

class PostCardActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.space4, vertical: Dimens.space4),
      child: Row(
        children: <Widget>[
          Padding(
            child: Icon(
              InstagramIcons.heart_outlined,
              size: 30,
              color: ThemeColors.black2,
            ),
            padding: EdgeInsets.all(Dimens.space4),
          ),
          Padding(
            child: Icon(
              InstagramIcons.comment_outlined,
              size: 30,
              color: ThemeColors.black2,
            ),
            padding: EdgeInsets.all(Dimens.space4),
          ),
          Padding(
            child: Icon(
              InstagramIcons.send_outlined,
              size: 30,
              color: ThemeColors.black2,
            ),
            padding: EdgeInsets.all(Dimens.space4),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.bookmark,
                size: 30,
                color: ThemeColors.black2,
              ),
              padding: EdgeInsets.all(Dimens.space4),
            ),
          ),
        ],
      ),
    );
  }
}
