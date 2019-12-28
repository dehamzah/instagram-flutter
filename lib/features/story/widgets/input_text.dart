import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';
import 'package:instagram_flutter/core/theme/theme_colors.dart';

class InputText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoTextField(
        suffix: Container(
          margin: EdgeInsets.only(right: Dimens.space8),
          child: Icon(
            Icons.more_vert,
            color: ThemeColors.white,
          ),
        ),
        placeholder: "Kirim pesan",
        padding: EdgeInsets.symmetric(
          vertical: Dimens.space12,
          horizontal: Dimens.space16,
        ),
        decoration: BoxDecoration(
          color: null,
          border: Border.all(
            color: ThemeColors.white.withOpacity(0.5),
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }
}
