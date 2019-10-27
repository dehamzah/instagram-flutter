import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Text('Instagram'),
      ),
      child: Container(
        child: Text('Home Screen'),
      ),
    );
  }
}
