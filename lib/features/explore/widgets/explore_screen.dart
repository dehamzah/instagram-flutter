import 'package:flutter/cupertino.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Text('Explore'),
      ),
      child: Container(
        child: Text('Explore Screen'),
      ),
    );
  }
}
