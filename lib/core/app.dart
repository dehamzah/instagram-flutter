import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter/features/navigation/widgets/navigation.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: Navigation(),
    );
  }
}
