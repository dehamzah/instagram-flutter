import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter/features/post/models/post.dart';
import 'package:instagram_flutter/features/post/services/post_service.dart';
import 'package:instagram_flutter/features/post/widgets/post_card.dart';

class PostFeed extends StatefulWidget {
  @override
  _PostFeedState createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  bool isLoading = false;
  List<Post> posts;

  @override
  void initState() {
    super.initState();
    this.getPosts();
  }

  void getPosts() async {
    setState(() {
      isLoading = true;
    });
    List<Post> _posts = await PostService.getLatestPosts();
    setState(() {
      posts = _posts;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return CupertinoActivityIndicator();

    if (posts == null || posts.length == 0) return Container();

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
