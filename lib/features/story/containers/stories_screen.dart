import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/theme/theme_colors.dart';
import 'package:instagram_flutter/features/story/containers/stories_hud.dart';
import 'package:instagram_flutter/features/story/models/story.dart';
import 'package:instagram_flutter/features/story/stores/story_store.dart';
import 'package:provider/provider.dart';

class StoriesScreen extends StatefulWidget {
  final int initialPageIndex;

  const StoriesScreen({Key key, this.initialPageIndex}) : super(key: key);

  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<StoryStore>(context, listen: false)
        .setStoriesScreenPageController(
      PageController(
        initialPage: widget.initialPageIndex,
      ),
    );
  }

  @override
  void dispose() {
    Provider.of<StoryStore>(context, listen: false)
        .storiesScreenPageController
        .dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Story> stories = Provider.of<StoryStore>(context).stories;
    PageController pageController =
        Provider.of<StoryStore>(context, listen: false)
            .storiesScreenPageController;

    return PageView.builder(
      controller: pageController,
      onPageChanged: (int index) {
        Provider.of<StoryStore>(context, listen: false)
            .setCurrentViewedStory(stories[index]);
      },
      itemCount: stories?.length,
      itemBuilder: (BuildContext context, int index) {
        String imageUrl = stories[index]
            .medias[stories[index].currentViewedStoryIndex]
            .mediaUrl;

        return Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Icon(
                    Icons.error_outline,
                    color: ThemeColors.white,
                  ),
                ),
              ),
            ),
            StoriesHud(story: stories[index]),
          ],
        );
      },
    );
  }
}
