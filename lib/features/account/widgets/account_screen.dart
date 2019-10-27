import 'package:flutter/cupertino.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Text('Account'),
      ),
      child: Container(
        child: Text('Account Screen'),
      ),
    );
  }
}
