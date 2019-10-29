import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        trailing: Icon(CupertinoIcons.share),
        leading: Icon(CupertinoIcons.photo_camera),
      ),
      child: Container(
        child: Text('Home Screen'),
      ),
    );
  }
}
