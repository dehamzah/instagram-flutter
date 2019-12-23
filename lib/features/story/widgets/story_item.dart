import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/config.dart';
import 'package:instagram_flutter/core/theme/colors.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/features/story/models/story.dart';

class StoryItem extends StatelessWidget {
  final Story story;

  const StoryItem({Key key, this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.amberAccent, width: 2),
          ),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(story.user.avatarUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(
          height: Dimens.space6,
        ),
        Text(
          story?.user?.username ?? '',
          style: TextStyle(
            fontSize: 12,
            color: isDark ? Colors.white : ThemeColors.black1,
          ),
        )
      ],
    );
  }
}
