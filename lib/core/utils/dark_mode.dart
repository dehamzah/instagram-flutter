import 'package:flutter/cupertino.dart';

bool isDark(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.dark;
}
