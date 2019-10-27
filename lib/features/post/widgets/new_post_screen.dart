import 'package:flutter/cupertino.dart';

class NewPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Text('New Post'),
      ),
      child: Container(
        child: Text('New Post Screen'),
      ),
    );
  }
}
