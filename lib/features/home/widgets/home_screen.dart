import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/core/utils/dark_mode.dart' as darkMode;
import 'package:instagram_flutter/features/post/containers/post_feed.dart';
import 'package:instagram_flutter/features/post/stores/post_store.dart';
import 'package:instagram_flutter/features/story/containers/stories_section.dart';
import 'package:instagram_flutter/features/story/stores/story_store.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _onRefresh() async {
    return Future.wait([
      Provider.of<StoryStore>(context, listen: false).getLatestStories(),
      Provider.of<PostStore>(context, listen: false).getLatestPosts()
    ]);
  }

  Widget _refreshIndicator(
    BuildContext context,
    RefreshIndicatorMode refreshState,
    double pulledExtent,
    double refreshTriggerPullDistance,
    double refreshIndicatorExtent,
  ) {
    const Curve opacityCurve = Interval(0.4, 0.8, curve: Curves.easeInOut);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          top: 115,
        ), // need to add this because it doesn't count the height of appbar
        child: refreshState == RefreshIndicatorMode.drag
            ? Opacity(
                opacity: opacityCurve.transform(
                    min(pulledExtent / refreshTriggerPullDistance, 1.0)),
                child: Icon(
                  CupertinoIcons.down_arrow,
                  color: CupertinoDynamicColor.resolve(
                      CupertinoColors.inactiveGray, context),
                  size: 36.0,
                ),
              )
            : Opacity(
                opacity: opacityCurve
                    .transform(min(pulledExtent / refreshIndicatorExtent, 1.0)),
                child: const CupertinoActivityIndicator(radius: 14.0),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkMode.isDark(context);
    String instagramIconAsset = isDark
        ? 'assets/images/instagram_white.png'
        : 'assets/images/instagram.png';
    double iconSize = 35;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            left: Dimens.space8,
            top: Dimens.space8,
            bottom: Dimens.space8,
          ),
          child: Image.asset(
            instagramIconAsset,
          ),
        ),
        leading: SvgPicture.asset(
          "assets/icons/photo_outlined.svg",
          color: Colors.white,
          semanticsLabel: "PAP",
          width: iconSize,
          height: iconSize,
        ),
        trailing: SvgPicture.asset(
          "assets/icons/inbox_outlined.svg",
          color: Colors.white,
          semanticsLabel: "Inbox",
          width: iconSize,
          height: iconSize,
        ),
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverRefreshControl(
            builder: _refreshIndicator,
            refreshIndicatorExtent: 80,
            refreshTriggerPullDistance: 80,
            onRefresh: _onRefresh,
          ),
          SliverSafeArea(
            top: true,
            bottom: false,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return StoriesSection();
                },
                childCount: 1,
              ),
            ),
          ),
          SliverSafeArea(
            top: false,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return PostFeed();
                },
                childCount: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
