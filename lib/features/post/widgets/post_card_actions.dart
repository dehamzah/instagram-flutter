import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/core/theme/theme_colors.dart';

class PostCardActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    double iconSize = 30;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.space16,
        vertical: Dimens.space8,
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: SvgPicture.asset(
              "assets/icons/heart_outlined.svg",
              color: isDark ? ThemeColors.white : ThemeColors.black2,
              semanticsLabel: "Love",
              width:
                  iconSize + 3, // source file heart icon is smaller than other
              height: iconSize + 3,
            ),
            margin: EdgeInsets.only(right: Dimens.space12),
          ),
          Container(
            child: SvgPicture.asset(
              "assets/icons/comment_outlined.svg",
              color: isDark ? ThemeColors.white : ThemeColors.black2,
              semanticsLabel: "Comment",
              width: iconSize,
              height: iconSize,
            ),
            margin: EdgeInsets.only(right: Dimens.space12),
          ),
          Container(
            child: SvgPicture.asset(
              "assets/icons/send_outlined.svg",
              color: isDark ? ThemeColors.white : ThemeColors.black2,
              semanticsLabel: "Send",
              width: iconSize,
              height: iconSize,
            ),
            margin: EdgeInsets.only(right: Dimens.space12),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(
                "assets/icons/bookmark_outlined.svg",
                color: isDark ? ThemeColors.white : ThemeColors.black2,
                semanticsLabel: "Bookmark",
                width: 22, // source file bookmark icon is bigger than other
                height: 22,
              ),
              margin: EdgeInsets.only(left: Dimens.space12),
            ),
          ),
        ],
      ),
    );
  }
}
