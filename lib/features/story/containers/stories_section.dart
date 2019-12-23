import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/features/story/models/story.dart';
import 'package:instagram_flutter/features/story/services/story_service.dart';
import 'package:instagram_flutter/features/story/widgets/story_item.dart';

class StoriesSection extends StatefulWidget {
  @override
  _StoriesSectionState createState() => _StoriesSectionState();
}

class _StoriesSectionState extends State<StoriesSection> {
  bool isLoading = false;
  List<Story> stories;

  @override
  void initState() {
    super.initState();
    this.getStories();
  }

  getStories() async {
    setState(() {
      isLoading = true;
    });
    stories = await StoryService.getLatestStories();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return CupertinoActivityIndicator();

    if (stories == null || stories.length == 0) return Container();

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
