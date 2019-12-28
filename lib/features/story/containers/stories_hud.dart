import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/core/theme/theme_colors.dart';
import 'package:instagram_flutter/core/theme/theme_text_styles.dart';
import 'package:instagram_flutter/features/story/models/story.dart';
import 'package:instagram_flutter/features/story/stores/story_store.dart';
import 'package:instagram_flutter/features/story/widgets/input_text.dart';
import 'package:provider/provider.dart';

class StoriesHud extends StatelessWidget {
  final Story story;

  const StoriesHud({Key key, @required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            _StoriesControl(),
            _StoriesInfo(story: story),
            AnimatedPositioned(
              duration: Duration(milliseconds: 150),
              curve: Curves.easeInOut,
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 0,
              right: 0,
              child: _StoriesAction(),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoriesControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Story currentViewedStory =
        Provider.of<StoryStore>(context).currentViewedStory;
    int currentViewedStoryIndex = Provider.of<StoryStore>(context)
        .currentViewedStory
        .currentViewedStoryIndex;

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                int prevIndex = currentViewedStoryIndex - 1;
                if (prevIndex < 0) {
                  Provider.of<StoryStore>(context, listen: false)
                      .storiesScreenPageController
                      ?.previousPage(
                          curve: Curves.easeInOut,
                          duration: Duration(milliseconds: 300));
                } else {
                  Provider.of<StoryStore>(context, listen: false)
                      .setCurrentViewedStoryIndex(
                          prevIndex, currentViewedStory);
                }
              },
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                int nextIndex = currentViewedStoryIndex + 1;
                if (nextIndex >= currentViewedStory.medias.length) {
                  Provider.of<StoryStore>(context, listen: false)
                      .storiesScreenPageController
                      ?.nextPage(
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 300),
                      );
                } else {
                  Provider.of<StoryStore>(context, listen: false)
                      .setCurrentViewedStoryIndex(
                    nextIndex,
                    currentViewedStory,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _StoriesInfo extends StatelessWidget {
  final Story story;

  const _StoriesInfo({Key key, @required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          _ProgressBars(),
          _StoryMeta(story: story),
        ],
      ),
    );
  }
}

class _ProgressBars extends StatefulWidget {
  @override
  __ProgressBarsState createState() => __ProgressBarsState();
}

class __ProgressBarsState extends State<_ProgressBars> {
  @override
  Widget build(BuildContext context) {
    Story currentViewedStory =
        Provider.of<StoryStore>(context).currentViewedStory;

    return Container(
      margin: EdgeInsets.all(Dimens.space8),
      child: Row(
        children: List.generate(currentViewedStory.medias.length, (int index) {
          return Expanded(
            child: Container(
              width: double.infinity,
              child: _ProgressBar(
                key: UniqueKey(),
                start: currentViewedStory.currentViewedStoryIndex == index,
                isRead: index < currentViewedStory.currentViewedStoryIndex,
                totalProgressBar: currentViewedStory.medias.length,
                onEnd: () {
                  if (index == currentViewedStory.medias.length - 1) {
                    Provider.of<StoryStore>(context, listen: false)
                        .storiesScreenPageController
                        ?.nextPage(
                          curve: Curves.easeInOut,
                          duration: Duration(milliseconds: 300),
                        );
                  } else {
                    Provider.of<StoryStore>(context, listen: false)
                        .setCurrentViewedStoryIndex(
                            index + 1, currentViewedStory);
                  }
                },
              ),
              margin: EdgeInsets.only(
                right: index == currentViewedStory.medias.length - 1
                    ? 0
                    : Dimens.space4,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _ProgressBar extends StatefulWidget {
  final int totalProgressBar;
  final bool start;
  final bool isRead;
  final Function onEnd;

  const _ProgressBar({
    Key key,
    @required this.totalProgressBar,
    this.start = false,
    this.isRead = false,
    this.onEnd,
  }) : super(key: key);

  @override
  __ProgressBarState createState() => __ProgressBarState();
}

class __ProgressBarState extends State<_ProgressBar> {
  double progress = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 0), () {
      double fullProgress =
          MediaQuery.of(context).size.width / widget.totalProgressBar;
      if (widget.start) {
        setState(() {
          progress = fullProgress;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double fullProgress =
        MediaQuery.of(context).size.width / widget.totalProgressBar;

    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 2,
          decoration: BoxDecoration(
            color: ThemeColors.white.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        AnimatedContainer(
          duration: Duration(seconds: 8), // TODO: get this from params
          onEnd: widget.onEnd,
          width: widget.isRead ? fullProgress : progress,
          height: 2,
          decoration: BoxDecoration(
            color: ThemeColors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
      ],
    );
  }
}

class _StoryMeta extends StatelessWidget {
  final Story story;

  const _StoryMeta({Key key, @required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (story == null) return Container();

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimens.space8,
        horizontal: Dimens.space16,
      ),
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: story.user.avatarUrl,
            imageBuilder: (context, imageProvider) => Container(
              height: 30,
              width: 30,
              margin: EdgeInsets.only(right: Dimens.space8),
              child: CircleAvatar(
                backgroundImage: imageProvider,
              ),
            ),
            placeholder: (context, url) => Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: Dimens.space8),
              child: CupertinoActivityIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text(
            story.user.username,
            style: ThemeTextStyles.h5().merge(
              TextStyle(
                color: ThemeColors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: ThemeColors.black1.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: Dimens.space6,
          ),
          Text(
            "12 jam", // TODO: get this from api createdAt
            style: ThemeTextStyles.h5().merge(
              TextStyle(
                color: ThemeColors.white.withOpacity(0.75),
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: ThemeColors.black1.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StoriesAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimens.space8),
      child: Row(
        children: <Widget>[
          _PhotoInputButton(),
          Expanded(
            child: InputText(),
          ),
          _SendButton(),
        ],
      ),
    );
  }
}

class _PhotoInputButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimens.space8),
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColors.white.withOpacity(0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      padding: EdgeInsets.all(Dimens.space8),
      child: Icon(
        Icons.photo_camera,
        color: ThemeColors.white,
        size: 30,
      ),
    );
  }
}

class _SendButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimens.space8),
      padding: EdgeInsets.all(Dimens.space8),
      child: Icon(
        Icons.send,
        color: ThemeColors.white,
        size: 30,
      ),
    );
  }
}
