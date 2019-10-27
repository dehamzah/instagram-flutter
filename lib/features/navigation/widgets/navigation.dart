import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter/features/account/widgets/account_screen.dart';
import 'package:instagram_flutter/features/activity/widgets/activity_screen.dart';
import 'package:instagram_flutter/features/explore/widgets/explore_screen.dart';
import 'package:instagram_flutter/features/home/widgets/home_screen.dart';
import 'package:instagram_flutter/features/not_found/widgets/not_found_screen.dart';
import 'package:instagram_flutter/features/post/widgets/new_post_screen.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add_circled),
            title: Text('New'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.folder),
            title: Text('Activity'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            title: Text('Account'),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return HomeScreen();
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) {
                return ExploreScreen();
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return NewPostScreen();
              },
            );
          case 3:
            return CupertinoTabView(
              builder: (context) {
                return ActivityScreen();
              },
            );
          case 4:
            return CupertinoTabView(
              builder: (context) {
                return AccountScreen();
              },
            );
          default:
            return CupertinoTabView(
              builder: (context) {
                return NotFoundScreen();
              },
            );
        }
      },
    );
  }
}
