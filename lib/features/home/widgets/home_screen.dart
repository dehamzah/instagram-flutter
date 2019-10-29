import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/icons/instagram_icons.dart';
import 'package:instagram_flutter/core/theme/dimens.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            top: Dimens.space8,
            bottom: Dimens.space8,
          ),
          child: Image.asset(
            'assets/images/instagram.png',
          ),
        ),
        leading: Icon(InstagramIcons.photo_outline),
        trailing: Icon(InstagramIcons.inbox_outlined),
      ),
      child: Container(
        child: Text('Home Screen'),
      ),
    );
  }
}
