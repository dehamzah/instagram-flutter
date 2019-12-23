import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter/features/navigation/widgets/navigation.dart';
import 'package:instagram_flutter/features/post/stores/post_store.dart';
import 'package:instagram_flutter/features/story/stores/story_store.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StoryStore()),
        ChangeNotifierProvider(create: (_) => PostStore()),
      ],
      child: CupertinoApp(
        title: 'Instagram Flutter',
        home: Navigation(),
      ),
    );
  }
}
