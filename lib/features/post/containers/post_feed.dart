import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter/features/post/models/post.dart';
import 'package:instagram_flutter/features/post/widgets/post_card.dart';

class PostFeed extends StatelessWidget {
  final List<Post> posts;

  const PostFeed({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.all(0),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return PostCard(
          post: posts[index],
        );
      },
    );
  }
}
