import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter/features/post/stores/post_store.dart';
import 'package:instagram_flutter/features/post/widgets/post_card.dart';
import 'package:provider/provider.dart';

class PostFeed extends StatefulWidget {
  @override
  _PostFeedState createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostStore>(context, listen: false).getLatestPosts();
  }

  @override
  Widget build(BuildContext context) {
    PostStore _postStore = Provider.of<PostStore>(context);
    if (_postStore.isLoading) return CupertinoActivityIndicator();

    if (_postStore.posts == null || _postStore.posts.length == 0) {
      return Container();
    }

    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.all(0),
      itemCount: _postStore.posts.length,
      itemBuilder: (BuildContext context, int index) {
        return PostCard(
          post: _postStore.posts[index],
        );
      },
    );
  }
}
