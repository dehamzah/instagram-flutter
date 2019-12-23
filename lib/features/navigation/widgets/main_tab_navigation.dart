import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/features/account/widgets/account_screen.dart';
import 'package:instagram_flutter/features/activity/widgets/activity_screen.dart';
import 'package:instagram_flutter/features/explore/widgets/explore_screen.dart';
import 'package:instagram_flutter/features/home/widgets/home_screen.dart';
import 'package:instagram_flutter/features/not_found/widgets/not_found_screen.dart';
import 'package:instagram_flutter/features/post/widgets/new_post_screen.dart';

class MainTabNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double iconSize = 35;

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home_outlined.svg",
              color: Colors.white,
              semanticsLabel: "Home",
              width: iconSize,
              height: iconSize,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/home.svg",
              color: Colors.white,
              semanticsLabel: "Home",
              width: iconSize,
              height: iconSize,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/search_outlined.svg",
              color: Colors.white,
              semanticsLabel: "Search",
              width: iconSize,
              height: iconSize,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/search.svg",
              color: Colors.white,
              semanticsLabel: "Search",
              width: iconSize,
              height: iconSize,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/new_outlined.svg",
              color: Colors.white,
              semanticsLabel: "New Post",
              width: iconSize,
              height: iconSize,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/heart_outlined.svg",
              color: Colors.white,
              semanticsLabel: "Favorite",
              width: iconSize,
              height: iconSize,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/heart.svg",
              color: Colors.white,
              semanticsLabel: "Favorite",
              width: iconSize,
              height: iconSize,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/user_outlined.svg",
              color: Colors.white,
              semanticsLabel: "Profile",
              width: iconSize,
              height: iconSize,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/user.svg",
              color: Colors.white,
              semanticsLabel: "Profile",
              width: iconSize,
              height: iconSize,
            ),
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
