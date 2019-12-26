import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/theme/theme_colors.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/features/story/models/story.dart';
import 'package:instagram_flutter/core/utils/dark_mode.dart' as darkMode;

const double _boxSize = 62;

class StoryItem extends StatefulWidget {
  final Story story;

  const StoryItem({Key key, @required this.story}) : super(key: key);

  @override
  _StoryItemState createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  double boxSize = _boxSize;

  @override
  Widget build(BuildContext context) {
    bool isDark = darkMode.isDark(context);

    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          onTapUp: (TapUpDetails tapUpDetails) {
            setState(() {
              boxSize = _boxSize;
            });
          },
          onTapDown: (TapDownDetails tapDownDetails) {
            setState(() {
              boxSize = _boxSize - 8;
            });
          },
          child: Container(
            alignment: Alignment.center,
            width: _boxSize,
            height: _boxSize,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 240),
                  width: boxSize,
                  height: boxSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.3, 0.5, 0.9],
                      colors: [
                        ThemeColors.red3,
                        ThemeColors.red2,
                        ThemeColors.yellow1
                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 240),
                  width: boxSize - 4,
                  height: boxSize - 4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDark ? ThemeColors.black1 : ThemeColors.white,
                  ),
                ),
                AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 240),
                  width: boxSize - 8,
                  height: boxSize - 8,
                  decoration: BoxDecoration(
                    color: ThemeColors.black2,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(widget.story.user.avatarUrl),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: Dimens.space6,
        ),
        Text(
          widget.story?.user?.username ?? '',
          style: TextStyle(
            fontSize: 12,
            color: isDark ? Colors.white : ThemeColors.black1,
          ),
        )
      ],
    );
  }
}
