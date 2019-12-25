import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/core/theme/theme_text_styles.dart';
import 'package:instagram_flutter/core/utils/dark_mode.dart' as darkMode;

class PostCardDescription extends StatefulWidget {
  final String description;
  final String username;
  final int maxChars;

  const PostCardDescription({
    Key key,
    this.description,
    @required this.username,
    this.maxChars = 85,
  }) : super(key: key);

  @override
  _PostCardDescriptionState createState() => _PostCardDescriptionState();
}

class _PostCardDescriptionState extends State<PostCardDescription> {
  bool isShowAllDesc = false;

  showAllDesc() {
    setState(() {
      isShowAllDesc = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkMode.isDark(context);

    String shortDescription = "";
    if (shortDescription != null) {
      if (widget.maxChars >= widget.description.length) {
        shortDescription = widget.description;
      } else {
        shortDescription = widget.description.substring(0, widget.maxChars);
      }
    }

    return GestureDetector(
      onTap: showAllDesc,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.space16,
        ),
        alignment: Alignment.topLeft,
        child: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: widget.username,
            style: ThemeTextStyles.h5(isDark: isDark),
            children: <InlineSpan>[
              TextSpan(text: " "),
              TextSpan(
                text: isShowAllDesc ? widget.description : shortDescription,
                style: ThemeTextStyles.body1(isDark: isDark),
              ),
              TextSpan(
                text: isShowAllDesc ? "" : "... lainnya",
                style: ThemeTextStyles.body2(isDark: isDark),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
