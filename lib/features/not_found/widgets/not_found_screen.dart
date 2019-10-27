import 'package:flutter/cupertino.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Text('Not Found'),
      ),
      child: Container(
        child: Text('Not Found Screen'),
      ),
    );
  }
}
