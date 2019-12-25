import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/core/utils/dark_mode.dart' as darkMode;
import 'package:instagram_flutter/features/post/containers/post_feed.dart';
import 'package:instagram_flutter/features/story/containers/stories_section.dart';

class HomeScreen extends StatelessWidget {
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
      child: ListView(
        children: <Widget>[
          StoriesSection(),
          PostFeed(),
        ],
      ),
    );
  }
}
