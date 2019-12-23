import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/features/story/stores/story_store.dart';
import 'package:instagram_flutter/features/story/widgets/story_item.dart';
import 'package:provider/provider.dart';

class StoriesSection extends StatefulWidget {
  @override
  _StoriesSectionState createState() => _StoriesSectionState();
}

class _StoriesSectionState extends State<StoriesSection> {
  @override
  void initState() {
    super.initState();
    Provider.of<StoryStore>(context, listen: false).getLatestStories();
  }

  @override
  Widget build(BuildContext context) {
    StoryStore _storyStore = Provider.of<StoryStore>(context);

    if (_storyStore.isLoading) return CupertinoActivityIndicator();

    if (_storyStore.stories == null || _storyStore.stories.length == 0) {
      return Container();
    }

    return Container(
      height: 105,
      width: double.infinity,
      child: ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: _storyStore.stories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return StoryItem(story: _storyStore.stories[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: Dimens.space16,
          );
        },
      ),
    );
  }
}
