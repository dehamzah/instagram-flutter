import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/features/story/containers/stories_hud.dart';
import 'package:instagram_flutter/features/story/models/story.dart';
import 'package:instagram_flutter/features/story/stores/story_store.dart';
import 'package:provider/provider.dart';

class StoriesScreen extends StatefulWidget {
  final Story story;

  const StoriesScreen({
    Key key,
    @required this.story,
  }) : super(key: key);

  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  @override
  Widget build(BuildContext context) {
    int currentViewedStoryIndex =
        Provider.of<StoryStore>(context).currentViewedStoryIndex;

    String imageUrl = widget.story.medias[currentViewedStoryIndex].mediaUrl;

    print('img $imageUrl');

    return WillPopScope(
      onWillPop: () async {
        Provider.of<StoryStore>(context, listen: false)
            .setCurrentViewedStoryIndex(0);
        Provider.of<StoryStore>(context, listen: false)
            .resetViewedStoryIndexes();
        return true;
      },
      child: Stack(
        children: <Widget>[
          // CachedNetworkImage(
          //   imageUrl: story.medias[0].mediaUrl,
          //   imageBuilder: (context, imageProvider) => Container(
          //     width: double.infinity,
          //     height: double.infinity,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: imageProvider,
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          //   placeholder: (context, url) => Container(
          //     width: double.infinity,
          //     height: double.infinity,
          //     child: Center(
          //       child: CupertinoActivityIndicator(),
          //     ),
          //   ),
          //   errorWidget: (context, url, error) => Container(
          //     width: double.infinity,
          //     height: double.infinity,
          //     child: Center(
          //       child: Icon(
          //         Icons.error_outline,
          //         color: ThemeColors.white,
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          StoriesHud(
            story: widget.story,
          ),
        ],
      ),
    );
  }
}
