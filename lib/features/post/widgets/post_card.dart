import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/features/post/models/post.dart';
import 'package:instagram_flutter/features/post/widgets/post_card_actions.dart';
import 'package:instagram_flutter/features/post/widgets/post_card_body.dart';
import 'package:instagram_flutter/features/post/widgets/post_card_description.dart';
import 'package:instagram_flutter/features/post/widgets/post_card_header.dart';
import 'package:instagram_flutter/features/post/widgets/post_card_stats.dart';

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
          PostCardActions(),
          PostCardStats(),
          PostCardDescription(
            username: post.user.username,
            description: post.description,
          ),
        ],
      ),
    );
  }
}
