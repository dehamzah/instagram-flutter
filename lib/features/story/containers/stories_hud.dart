import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/core/theme/theme_colors.dart';
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
            _StoriesInfo(
              story: story,
            ),
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

class _StoriesInfo extends StatelessWidget {
  final Story story;

  const _StoriesInfo({Key key, @required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          _ProgressBars(
            story: story,
          ),
        ],
      ),
    );
  }
}

class _ProgressBars extends StatefulWidget {
  final Story story;

  const _ProgressBars({Key key, @required this.story}) : super(key: key);

  @override
  __ProgressBarsState createState() => __ProgressBarsState();
}

class __ProgressBarsState extends State<_ProgressBars> {
  @override
  Widget build(BuildContext context) {
    int currentViewedStoryIndex =
        Provider.of<StoryStore>(context).currentViewedStoryIndex;
    List<int> viewedStoryIndexes =
        Provider.of<StoryStore>(context).viewedStoryIndexes;

    print('currentViewedStoryIndex $currentViewedStoryIndex');
    print('viewedStoryIndexes $viewedStoryIndexes');

    return Container(
      margin: EdgeInsets.all(Dimens.space8),
      child: Row(
        children: List.generate(widget.story.medias.length, (int index) {
          return Expanded(
            child: Container(
              width: double.infinity,
              child: _ProgressBar(
                key: UniqueKey(),
                start: currentViewedStoryIndex == index,
                finish: viewedStoryIndexes.contains(index),
                totalProgressBar: widget.story.medias.length,
                onEnd: () {
                  if (index != widget.story.medias.length - 1) {
                    Provider.of<StoryStore>(context, listen: false)
                        .setCurrentViewedStoryIndex(index + 1);
                  } else {
                    Navigator.of(context).pop();
                    return;
                  }

                  Provider.of<StoryStore>(context, listen: false)
                      .addViewedStoryIndex(index);
                },
              ),
              margin: EdgeInsets.only(
                right:
                    index == widget.story.medias.length - 1 ? 0 : Dimens.space4,
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
  final bool finish;
  final Function onEnd;

  const _ProgressBar({
    Key key,
    @required this.totalProgressBar,
    this.start = false,
    this.finish = false,
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
          width: widget.finish ? fullProgress : progress,
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
