import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/features/story/models/story.dart';
import 'package:instagram_flutter/features/story/widgets/story_item.dart';

class StoriesSection extends StatelessWidget {
  final List<Story> stories;

  const StoriesSection({Key key, this.stories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: double.infinity,
      child: ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: stories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return StoryItem(story: stories[index]);
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
