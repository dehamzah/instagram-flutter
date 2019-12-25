import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter/core/theme/theme_text_styles.dart';
import 'package:instagram_flutter/core/utils/dark_mode.dart' as darkMode;

class PostCardStats extends StatelessWidget {
  final int totalLove;

  const PostCardStats({
    Key key,
    this.totalLove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = darkMode.isDark(context);

    if (totalLove == null) return Container();

    return Text(
      "$totalLove suka",
      style: ThemeTextStyles.h5(isDark: isDark),
    );
  }
}
