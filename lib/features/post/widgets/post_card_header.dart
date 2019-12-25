import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/core/theme/theme_colors.dart';
import 'package:instagram_flutter/core/theme/theme_text_styles.dart';
import 'package:instagram_flutter/core/utils/dark_mode.dart' as darkMode;

class PostCardHeader extends StatelessWidget {
  final String avatarUrl;
  final String title;
  final String subtitle;

  const PostCardHeader({Key key, this.avatarUrl, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = darkMode.isDark(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimens.space8,
        horizontal: Dimens.space16,
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 30,
            width: 30,
            margin: EdgeInsets.only(right: Dimens.space8),
            child: CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: ThemeTextStyles.h5(isDark: isDark),
                ),
                subtitle != null
                    ? Padding(
                        padding: EdgeInsets.only(top: Dimens.space2),
                        child: Text(
                          subtitle,
                          style: ThemeTextStyles.caption1(isDark: isDark),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          Icon(
            Icons.more_vert,
            color: isDark ? ThemeColors.white : ThemeColors.black2,
          )
        ],
      ),
    );
  }
}
