import 'package:flutter/cupertino.dart';

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Text('Activity'),
      ),
      child: Container(
        child: Text('Activity Screen'),
      ),
    );
  }
}
