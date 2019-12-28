import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/theme/theme_colors.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/core/utils/position.dart';
import 'package:instagram_flutter/core/widgets/scale_route_transition.dart';
import 'package:instagram_flutter/features/story/containers/stories_screen.dart';
import 'package:instagram_flutter/features/story/models/story.dart';
import 'package:instagram_flutter/core/utils/dark_mode.dart' as darkMode;
import 'package:instagram_flutter/features/story/stores/story_store.dart';
import 'package:provider/provider.dart';

const double _boxSize = 62;

class StoryItem extends StatefulWidget {
  final Story story;
  final int index;

  const StoryItem({Key key, @required this.story, @required this.index})
      : super(key: key);

  @override
  _StoryItemState createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  double boxSize = _boxSize;
  List<double> alignmentPosition = List<double>();

  @override
  Widget build(BuildContext context) {
    bool isDark = darkMode.isDark(context);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Provider.of<StoryStore>(context, listen: false)
                .setCurrentViewedStory(widget.story);
            Navigator.of(context, rootNavigator: true).push(
              ScaleRouteTransition(
                screen: StoriesScreen(initialPageIndex: widget.index),
                posX: alignmentPosition[0],
                posY: alignmentPosition[1],
              ),
            );
          },
          onTapCancel: () {
            setState(() {
              boxSize = _boxSize;
            });
          },
          onTapUp: (TapUpDetails tapUpDetails) {
            setState(() {
              boxSize = _boxSize;
            });
          },
          onTapDown: (TapDownDetails tapDownDetails) {
            setState(() {
              boxSize = _boxSize - 8;
              alignmentPosition = getAlignmentPosition(
                tapDownDetails.globalPosition.dx,
                tapDownDetails.globalPosition.dy,
                screenWidth,
                screenHeight,
              );
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
                CachedNetworkImage(
                  imageUrl: widget.story.user.avatarUrl,
                  imageBuilder: (context, imageProvider) => AnimatedContainer(
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 240),
                    width: boxSize - 8,
                    height: boxSize - 8,
                    decoration: BoxDecoration(
                      color: ThemeColors.black2,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
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
