import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/config.dart';
import 'package:instagram_flutter/core/icons/instagram_icons.dart';
import 'package:instagram_flutter/core/theme/colors.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/features/post/models/media.dart';
import 'package:instagram_flutter/features/post/models/post.dart';
import 'package:instagram_flutter/core/utils/dark_mode.dart' as darkMode;

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
            medias: post.medias,
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
    bool isDark = darkMode.isDark(context);

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
                    color: isDark ? Colors.white : ThemeColors.black1,
                  ),
                ),
                subtitle != null
                    ? Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: isDark ? Colors.white : ThemeColors.black1,
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          Icon(
            Icons.more_vert,
            color: isDark ? Colors.white : ThemeColors.black2,
          )
        ],
      ),
    );
  }
}

class PostCardBody extends StatelessWidget {
  final List<Media> medias;

  const PostCardBody({
    Key key,
    this.medias,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: PageView.builder(
        itemCount: medias.length,
        itemBuilder: (BuildContext context, int index) {
          if (medias[index].mediaType == MediaType.image) {
            return Image(
              width: double.infinity,
              height: 300,
              image: NetworkImage(medias[index].mediaUrl),
              fit: BoxFit.cover,
            );
          } else {
            // TODO: create video component
            return Container();
          }
        },
      ),
    );
  }
}

class PostCardActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.space4, vertical: Dimens.space4),
      child: Row(
        children: <Widget>[
          Padding(
            child: Icon(
              InstagramIcons.heart_outlined,
              size: 30,
              color: isDark ? Colors.white : ThemeColors.black2,
            ),
            padding: EdgeInsets.all(Dimens.space4),
          ),
          Padding(
            child: Icon(
              InstagramIcons.comment_outlined,
              size: 30,
              color: isDark ? Colors.white : ThemeColors.black2,
            ),
            padding: EdgeInsets.all(Dimens.space4),
          ),
          Padding(
            child: Icon(
              InstagramIcons.send_outlined,
              size: 30,
              color: isDark ? Colors.white : ThemeColors.black2,
            ),
            padding: EdgeInsets.all(Dimens.space4),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.bookmark,
                size: 30,
                color: isDark ? Colors.white : ThemeColors.black2,
              ),
              padding: EdgeInsets.all(Dimens.space4),
            ),
          ),
        ],
      ),
    );
  }
}
